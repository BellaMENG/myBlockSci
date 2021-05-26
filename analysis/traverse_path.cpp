#include "util.hpp"
#include <string>
#include <queue>
#include <fstream>
#include <chrono>
#include <time.h>

void printAddressFromString(Blockchain &chain, string address) {
    auto randomAddress = getAddressFromString(address, chain.getAccess());
    if (randomAddress) {
        cout << "scriptNum: " << randomAddress->scriptNum << endl;
        cout << "type: " << randomAddress->type << endl;
        cout << "toString: " << randomAddress->toString() << endl;
    }
}

void printOutputs(Blockchain &chain, string address) {
    auto randomAddress = getAddressFromString(address, chain.getAccess());
    if (randomAddress) {
        RANGES_FOR(auto input, (*randomAddress).getInputs()) {
            Transaction tx = input.transaction();
//            if (outAddr != *randomAddress)
            RANGES_FOR(auto out, tx.outputs()) {
                Address out_addr = out.getAddress();
                cout << out_addr.toString() << endl;
                
            }
        }
    }
}

bool findPath(Blockchain &chain, string src, string dest) {
    auto srcAddress = getAddressFromString(src, chain.getAccess());
    auto destAddress = getAddressFromString(dest, chain.getAccess());
    if ((!srcAddress) || (!destAddress)) {
        return false;
    }
    queue<Address> address_queue;
    address_queue.push(*srcAddress);
    while (!address_queue.empty()) {
        Address curr = address_queue.front();
        address_queue.pop();
        RANGES_FOR(auto input, curr.getInputs()) {
            Transaction tx = input.transaction();
            RANGES_FOR(auto out, tx.outputs()) {
                Address out_addr = out.getAddress();
                if (out_addr == *destAddress) {
                    cout << "found" << endl;
                    return true;
                }
                else
                    address_queue.push(out_addr);
            }
        }
    }
    cout << "doesn't exist" << endl;
    return false;
}

bool findPathGroups(Blockchain &chain, string src, unordered_set<Address> dests) {
    auto srcAddress = getAddressFromString(src, chain.getAccess());
    if (!srcAddress)
        return false;
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    address_queue.push(*srcAddress);
    while (!address_queue.empty()) {
        Address curr = address_queue.front();
        address_queue.pop();
        RANGES_FOR(auto input, curr.getInputs()) {
            Transaction tx = input.transaction();
            RANGES_FOR(auto out, tx.outputs()) {
                Address out_addr = out.getAddress();
                if (visited.find(out_addr) == visited.end()) {
                    if ((dests.find(out_addr) != dests.end())) {
                        cout << "found" << endl;
                        return true;
                    }
                    else {
                        address_queue.push(out_addr);
                        visited.insert(out_addr);
                    }
                }
            }
        }
    }
    cout << "doesn't exist" << endl;
    return false;
}

void read_addresses(Blockchain& chain, string file_path, int& num_addrs, unordered_set<Address>& addresses) {
    std::ifstream inputf(file_path, std::ifstream::in);
    char sharp;
    string addr;
    inputf >> sharp >> num_addrs;
    for (int i = 0; i < num_addrs; ++i) {
        inputf >> addr;
        auto dest_addr = getAddressFromString(addr, chain.getAccess());
        if (dest_addr)
            addresses.insert(*dest_addr);
    }
}

void getAddrFromScriptNum(Blockchain& chain, uint32_t addressNum, AddressType::Enum type, DataAccess &access) {
    Address createAddr(addressNum, type, access);
//    cout << createAddr.toString() << endl;
}

bool findPathRaw(Address& src, unordered_set<Address>& dests) {
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    address_queue.push(src);
    while (!address_queue.empty()) {
        Address curr = address_queue.front();
        address_queue.pop();
        RANGES_FOR(auto input, curr.getInputs()) {
            Transaction tx = input.transaction();
            RANGES_FOR(auto out, tx.outputs()) {
                Address out_addr = out.getAddress();
                if (visited.find(out_addr) == visited.end()) {
                    if ((dests.find(out_addr) != dests.end())) {
                        return true;
                    }
                    else {
                        address_queue.push(out_addr);
                        visited.insert(out_addr);
                    }
                }
            }
        }
    }
    return false;

}

uint32_t testFindPath(Blockchain &chain, uint32_t start, uint32_t pubkeyCount, unordered_set<Address>& dests) {
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    uint32_t trueResults = 0;
    uint32_t falseResults = 0;
    for (uint32_t i = start; i < start + pubkeyCount; ++i) {
        Address createAddr(i, AddressType::PUBKEYHASH, chain.getAccess());
        if (findPathRaw(createAddr, dests))
            trueResults++;
    }
    return trueResults;
}

uint32_t even_testFindPath(Blockchain &chain, uint32_t start, uint32_t pubkeyCount, uint32_t step, unordered_set<Address>& dests) {
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    uint32_t trueResults = 0;
    uint32_t falseResults = 0;
    for (uint32_t i = 0; i < pubkeyCount; i += step) {
        Address createAddr(i, AddressType::PUBKEYHASH, chain.getAccess());
        if (findPathRaw(createAddr, dests))
            trueResults++;
    }
    return trueResults;
}

uint32_t random_testFindPath(Blockchain &chain, unordered_set<uint32_t>& random_index, uint32_t count, unordered_set<Address>& dests) {
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    uint32_t trueResults = 0;
    for (auto itr = random_index.begin(); itr != random_index.end(); ++itr) {
        uint32_t index = *itr;
        Address createAddr(index, AddressType::PUBKEYHASH, chain.getAccess());
        if (findPathRaw(createAddr, dests))
            trueResults++;
    }
    return trueResults;
}

void random_generator(unordered_set<uint32_t>& random_numbers, uint32_t range, uint32_t size) {
    srand((unsigned)time(NULL));
    while(random_numbers.size() < size) {
        random_numbers.insert(rand() % range);
    }
}

int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
//    string src_addr = argv[2];
//    string dest_addr = argv[3];
    string dest_addr_file_path = argv[2];
//    int start = stoi(argv[5]);
    int num_addresses = stoi(argv[3]);
    Blockchain chain(chain_fp);
    
//    findPath(chain, src_addr, dest_addr);
    
    int num_addrs;
    unordered_set<Address> dest_addrs;
    
    read_addresses(chain, dest_addr_file_path, num_addrs, dest_addrs);
    
//    string addr = "3PXswrSTz7tW73BKFcU8GENGFtoagKUJP3";
//    printAddressFromString(chain, addr);
    //printOutputs(chain, src_addr);
    uint32_t pubkeyCount = chain.addressCount(AddressType::PUBKEYHASH);
    cout << "pubkey count: " << pubkeyCount << endl;
    if (num_addresses > pubkeyCount)
        num_addresses = pubkeyCount;
    
    unordered_set<uint32_t> random_index;
    random_generator(random_index, pubkeyCount, num_addresses);
    
    cout << "start to find path" << endl;
    auto start_clock = chrono::high_resolution_clock::now();
    
//    uint32_t trueResults = testFindPath(chain, start, num_addresses, dest_addrs);
//    uint32_t trueRandResults = even_testFindPath(chain, start, pubkeyCount, pubkeyCount/2000, dest_addrs);
    uint32_t random_results = random_testFindPath(chain, random_index, num_addresses, dest_addrs);
//    findPathGroups(chain, src_addr, dest_addrs);
//    for (uint32_t i = 0; i < pubkeyCount; ++i) {
//        getAddrFromScriptNum(chain, i, AddressType::PUBKEYHASH, chain.getAccess());
//    }
    auto end_clock = chrono::high_resolution_clock::now();
    chrono::duration<double> diff = end_clock - start_clock;
    printf("Elapsed Time: %.9lf s\n", diff.count());
    printf("Number of positive results is %d\n", (int)random_results);
    float avg = diff.count()/num_addresses;
    printf("Average query time is %.9lf s\n", avg);
//    cout << sizeof(Blockchain) << endl;
    return 0;
}
