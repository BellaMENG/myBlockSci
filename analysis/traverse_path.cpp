#include "util.hpp"
#include <string>
#include <queue>
#include <fstream>

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
        RANGES_FOR(auto input, (*srcAddress).getInputs()) {
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
    address_queue.push(*srcAddress);
    while (!address_queue.empty()) {
        Address curr = address_queue.front();
        address_queue.pop();
        RANGES_FOR(auto input, (*srcAddress).getInputs()) {
            Transaction tx = input.transaction();
            RANGES_FOR(auto out, tx.outputs()) {
                Address out_addr = out.getAddress();
                if ((dests.find(out_addr) != dests.end())) {
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

void read_addresses(Blockchain& chain, string file_path, int& num_addrs, unordered_set<Address>*& addresses) {
    std::ifstream inputf(file_path, std::ifstream::in);
    char sharp;
    string addr;
    inputf >> sharp >> num_addrs;
    for (int i = 0; i < num_addrs; ++i) {
        inputf >> addr;
        auto dest_addr = getAddressFromString(addr, chain.getAccess());
        if (dest_addr)
            addresses->insert(dest_addr);
    }
}

int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
    string src_addr = argv[2];
    string dest_addr = argv[3];
    string dest_addr_file_path = argv[4];
    Blockchain chain(chain_fp);
    
//    findPath(chain, src_addr, dest_addr);
    
    int num_addrs;
    unordered_set<Address>* dest_addrs = nullptr;
    
    read_addresses(chain, dest_addr_file_path, num_addrs, dest_addrs);
    
//    string addr = "3PXswrSTz7tW73BKFcU8GENGFtoagKUJP3";
//    printAddressFromString(chain, addr);
    //printOutputs(chain, src_addr);
    findPathGroups(chain, src_addr, *dest_addrs);
    
    return 0;
}
