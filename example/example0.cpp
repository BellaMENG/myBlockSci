//
//  main.cpp
//  blocksci-test
//
//  Created by Harry Kalodner on 1/3/17.
//  Copyright © 2017 Harry Kalodner. All rights reserved.
//

#include <blocksci/blocksci.hpp>
#include <blocksci/chain/algorithms.hpp>
#include <blocksci/chain/transaction.hpp>
#include <blocksci/chain/block.hpp>
#include <blocksci/script.hpp>
#include <blocksci/address/address.hpp>
#include <blocksci/chain/transaction_range.hpp>
#include <blocksci/heuristics/taint.hpp>

#include <range/v3/all.hpp>

#include <numeric>
#include <chrono>
#include <unordered_map>
#include <fstream>
#include <iostream>
#include <string>
#include <iomanip>
#include <vector>
#include <utility>

#include "parallel_hashmap/phmap.h"
#include "parallel_hashmap/phmap_dump.h"
#include "parallel_hashmap/btree.h"

using namespace blocksci;
using namespace std;
using phmap::flat_hash_map;
using phmap::flat_hash_set;
using phmap::btree_set;

// This one should be dumped
void generateUndirected(string fp) {
    flat_hash_map<Address, int64_t> addr_id;
    vector<int64_t> edge_list;
    flat_hash_map<int64_t, btree_set<int64_t>> edgemap;

    int64_t index = 0;
    Blockchain chain(fp);

    for(auto block: chain) {
        RANGES_FOR(auto tx, block) {
            vector<int64_t> input_id;
            vector<int64_t> output_id;

            RANGES_FOR(auto input, tx.inputs()) {
                Address addr = input.getAddress();
                flat_hash_map<Address, int64_t>::const_iterator map_itr = addr_id.find(addr);
                if (map_itr == addr_id.end()) {
                    addr_id[addr] = index;
                    input_id.push_back(index);
                    index++;
                } else {
                    input_id.push_back(map_itr->second);
                }
                
            }

            RANGES_FOR(auto output, tx.outputs()) {
                Address addr = output.getAddress();
                flat_hash_map<Address, int64_t>::const_iterator map_itr = addr_id.find(addr);
                if (map_itr == addr_id.end()) {
                    addr_id[addr] = index;
                    output_id.push_back(index);
                    index++;
                } else {
                    output_id.push_back(map_itr->second);
                }
            }
            for (int i = 0; i < input_id.size(); ++i) {
                for (int j = 0; j < output_id.size(); ++j) {
                    int v1, v2;
                    if (input_id[i] < output_id[j]) {
                        v1 = input_id[i];
                        v2 = output_id[j];
                    } else if (input_id[i] > output_id[j]) {
                        v1 = output_id[j];
                        v2 = input_id[i];
                    } else {
                        continue;
                    }

                    flat_hash_map<int64_t, btree_set<int64_t>>::const_iterator map_itr = edgemap.find(v1);
                    if (map_itr == edgemap.end()) {
                        btree_set<int64_t> vertexset;
                        vertexset.insert(v2);
                        edgemap[v1] = vertexset;
                    } else {
                        btree_set<int64_t> vertexset = map_itr->second;
                        vertexset.insert(v2);
                        edgemap[v1] = vertexset;
                    }
                }
            }
        
        }
    }

    vector<int64_t> edgeList;
    for (int64_t i = 0; i <= index; ++i) {
        flat_hash_map<int64_t, btree_set<int64_t>>::const_iterator map_itr = edgemap.find(i);
        if (map_itr == edgemap.end()) {
            continue;
        }
        btree_set<int64_t> vertexSet = edgemap[i];
        btree_set<int64_t>::iterator it;
        for (it = vertexSet.begin(); it != vertexSet.end(); ++it) {
            edgeList.push_back(i);
            edgeList.push_back(*it);
        }
    }

    ofstream ofs; 
    ofs.open("undirected.txt");
    for (int64_t i = 0; i < edgeList.size() - 1; i += 2) {
        ofs << edgeList[i] << " " << edgeList[i+1] << "\n";
    }
    ofs.close();

}


void convertStrings(string& addr) {
    std::size_t left_bracket = addr.find('(');
    addr = addr.substr(left_bracket + 1, addr.length() - left_bracket - 2); 
}


void createIndexListNEdgeList(string fp, int max_block=600000) {
    Blockchain chain(fp);
    int64_t block_id = 1;
    int64_t index = 0;

    flat_hash_set<Address> addr_set;

    vector<pair<int64_t, string>> idxpairs;
    for (auto block: chain) {
        if (block_id > max_block)
            break;
        if (block_id % 10000 == 0) {
            cout << "processed " << block_id << " blocks" << endl;
        }

        block_id++;

        RANGES_FOR(auto tx, block) {

            RANGES_FOR(auto input, tx.inputs()) {
                Address addr = input.getAddress();
                flat_hash_set<Address>::const_iterator set_itr = addr_set.find(addr);
                if (set_itr != addr_set.end()) {
                    continue;
                }
                addr_set.insert(addr);
                string addrStr = addr.toString();
                convertStrings(addrStr);
                pair<int64_t, string> idxpair;
                idxpair = std::make_pair(index, addrStr);
                //cout << index << ": " << addrStr <<endl;
                idxpairs.push_back(idxpair);

                index++;
            }

            RANGES_FOR(auto output, tx.outputs()) {
                Address addr = output.getAddress();
                flat_hash_set<Address>::const_iterator set_itr = addr_set.find(addr);
                if (set_itr != addr_set.end())
                    continue;
                addr_set.insert(addr);
                string addrStr = addr.toString();
                convertStrings(addrStr);
                pair<int64_t, string> idxpair;
                idxpair = std::make_pair(index, addrStr);
                //cout << index << ": " << addrStr << endl;
                idxpairs.push_back(idxpair);

                index++;
            }
        }

    }
    cout << "createIndexListNEdgeList: " << index << endl;

    ofstream myfile;
    string fn = "idxpairs" + to_string(max_block) + ".txt";
    myfile.open(fn);
    vector<pair<int64_t, string>>::iterator vec_itr; 
    for (vec_itr = idxpairs.begin(); vec_itr != idxpairs.end(); ++vec_itr) {
        myfile << (*vec_itr).first << " " << (*vec_itr).second << "\n";
    }
    myfile.close();
}


void generateEdgeList(string fp, int max_block=600000) {
    flat_hash_map<Address, int64_t> addr_id;
    vector<int64_t> edge_list;

    int64_t index = 0;
    Blockchain chain(fp);

    int64_t block_id = 1;
    for (auto block: chain) {
        if (block_id > max_block)
            break;
        if (block_id % 10000 == 0) {
            cout << block_id << " blocks processed" << endl;
        }
        block_id++;
        RANGES_FOR(auto tx, block) {
            vector<int64_t> input_id;
            vector<int64_t> output_id;

            RANGES_FOR(auto input, tx.inputs()) {
                Address addr = input.getAddress();
                flat_hash_map<Address, int64_t>::const_iterator map_itr = addr_id.find(addr);
                if (map_itr == addr_id.end()) {
                    addr_id[addr] = index;
                    input_id.push_back(index);
                    index++;
                } else {
                    input_id.push_back(map_itr->second);
                }
            }

            RANGES_FOR(auto output, tx.outputs()) {
                Address addr = output.getAddress();
                flat_hash_map<Address, int64_t>::const_iterator map_itr = addr_id.find(addr);
                if (map_itr == addr_id.end()) {
                    addr_id[addr] = index;
                    output_id.push_back(index);
                    index++;
                } else {
                    output_id.push_back(map_itr->second);
                }
            }

            for (int i = 0; i < input_id.size(); ++i) {
                for (int j = 0; j < output_id.size(); ++j) {
                    edge_list.push_back(input_id[i]);
                    edge_list.push_back(output_id[j]);
                }
            }
        }
    }
    cout << "final index: " << index << endl;
    ofstream myfile;
    string fn = "edge_list";
    fn += to_string(max_block);
    fn += ".txt";
    myfile.open(fn);
    for (int i = 0; i < edge_list.size() - 1; i += 2) {
        myfile << edge_list[i] << " " << edge_list[i+1] << "\n";
    }
    myfile.close();

}


void createClusters(string block_fp, int maxHeight) {
    return;
}

int main(int argc, const char * argv[]) {
    string block_fp = argv[1];
    //createIndexListNEdgeList(block_fp, 200000);
    generateEdgeList(block_fp, 200000);
//    generateUndirected(block_fp);
/*
    Blockchain chain(argv[1]);

    int64_t blockCount = 0;
    int64_t txCount = 0;
    int64_t inputCount = 0;
    int64_t outputCount = 0;

    for (auto block : chain) {
        blockCount += 1;
        RANGES_FOR(auto tx, block) {
            txCount += 1;
            inputCount += tx.inputCount();
            outputCount += tx.outputCount();
        }
    }

    std::cout << "Chain contains:" << std::endl;
    std::cout << blockCount << " blocks" << std::endl;
    std::cout << txCount << " transactions" << std::endl;
    std::cout << inputCount << " inputs" << std::endl;
    std::cout << outputCount << " outputs" << std::endl;
*/
    return 0;
}

