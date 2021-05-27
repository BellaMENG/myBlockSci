#include "util.hpp"
#include "traverse_path.h"
#include <string>
#include <queue>
#include <fstream>
#include <chrono>

__constant__ Blockchain chain;
__constant__ unordered_set<Address> dest_addrs;

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
    
    cudaDeviceReset();
    cudaEvent_t cuda_start, cuda_end;
    cudaEventCreate(&cuda_start);
    cudaEventCreate(&cuda_end);
    cudaEventRecord(cuda_start);

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
    
    
    float kernel_time;
    
    auto start_clock = chrono::high_resolution_clock::now();

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
