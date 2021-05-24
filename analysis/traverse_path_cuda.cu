#include "util.hpp"
#include <string>
#include <queue>
#include <fstream>
#include <chrono>

__constant__ Blockchain chain;
__constant__ unordered_set<Address> dest_addrs;

void printAddressFromString(Blockchain &h_chain, string address) {
    auto randomAddress = getAddressFromString(address, h_chain.getAccess());
    if (randomAddress) {
        cout << "scriptNum: " << randomAddress->scriptNum << endl;
        cout << "type: " << randomAddress->type << endl;
        cout << "toString: " << randomAddress->toString() << endl;
    }
}

void printOutputs(Blockchain &h_chain, string address) {
    auto randomAddress = getAddressFromString(address, h_chain.getAccess());
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

bool findPath(Blockchain &h_chain, string src, string dest) {
    auto srcAddress = getAddressFromString(src, h_chain.getAccess());
    auto destAddress = getAddressFromString(dest, h_chain.getAccess());
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

bool findPathGroups(Blockchain &h_chain, string src, unordered_set<Address> dests) {
    auto srcAddress = getAddressFromString(src, h_chain.getAccess());
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

void read_addresses(Blockchain& h_chain, string file_path, int& num_addrs, unordered_set<Address>& addresses) {
    std::ifstream inputf(file_path, std::ifstream::in);
    char sharp;
    string addr;
    inputf >> sharp >> num_addrs;
    for (int i = 0; i < num_addrs; ++i) {
        inputf >> addr;
        auto dest_addr = getAddressFromString(addr, h_chain.getAccess());
        if (dest_addr)
            addresses.insert(*dest_addr);
    }
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

uint32_t testFindPath(Blockchain &h_chain, uint32_t start, uint32_t pubkeyCount, unordered_set<Address>& dests) {
    queue<Address> address_queue;
    unordered_set<Address> visited;
    
    uint32_t trueResults = 0;
    uint32_t falseResults = 0;
    for (uint32_t i = start; i < start + pubkeyCount; ++i) {
        Address createAddr(i, AddressType::PUBKEYHASH, h_chain.getAccess());
        if (findPathRaw(createAddr, dests))
            trueResults++;
    }
    return trueResults;
}

__global__
void cuda_findPath(uint32_t start, uint32_t pubkeyCount) {
    
}

int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
    string src_addr = argv[2];
    string dest_addr = argv[3];
    string dest_addr_file_path = argv[4];
    int start = stoi(argv[5]);
    int num_addresses = stoi(argv[6]);
    Blockchain h_chain(chain_fp);
    
    cudaMemcpyToSymbol(*chain, *h_chain, sizeof(Blockchain));
    
//    findPath(chain, src_addr, dest_addr);
    
    int num_addrs;
    unordered_set<Address> h_dest_addrs;
    
    read_addresses(h_chain, dest_addr_file_path, num_addrs, h_dest_addrs);
    cudaMemcpyToSymbol(&dest_addr, h_dest_addrs, num_addrs*sizeof(Address));
    
    uint32_t pubkeyCount = h_chain.addressCount(AddressType::PUBKEYHASH);
    cout << "pubkey count: " << pubkeyCount << endl;
    if (num_addresses > pubkeyCount)
        num_addresses = pubkeyCount;
    
    cudaDeviceReset();
    cudaEvent_t cuda_start, cuda_end;
    float kernel_time;
    
    auto start_clock = chrono::high_resolution_clock::now();
    
    cudaEventCreate(&cuda_start);
    cudaEventCreate(&cuda_end);
    cudaEventRecord(cuda_start);

//    cuda_findPath<<<512, 8>>>();
    
    cudaEventRecord(cuda_end);

    cudaEventSynchronize(cuda_start);
    cudaEventSynchronize(cuda_end);

    cudaEventElapsedTime(&kernel_time, cuda_start, cuda_end);
    GPUErrChk(cudaDeviceSynchronize());
    
    auto end_clock = chrono::high_resolution_clock::now();
    chrono::duration<double> diff = end_clock - start_clock;
    printf("Elapsed Time: %.9lf s\n", diff.count());
    printf("Number of positive results is %d\n", (int)trueResults);
    float avg = diff.count()/num_addresses;
    printf("Average query time is %.9lf s\n", avg);
    
    return 0;
}
