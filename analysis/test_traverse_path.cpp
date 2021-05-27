#include "traverse_path.h"

int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
    string dest_addr_file_path = argv[2];
    int num_addresses = stoi(argv[3]);
    Blockchain chain(chain_fp);
        
    int num_addrs;
    unordered_set<Address> dest_addrs;
    
    read_addresses(chain, dest_addr_file_path, num_addrs, dest_addrs);
    
    uint32_t pubkeyCount = chain.addressCount(AddressType::PUBKEYHASH);
    cout << "pubkey count: " << pubkeyCount << endl;
    if (num_addresses > pubkeyCount)
        num_addresses = pubkeyCount;
    
    unordered_set<uint32_t> random_index;
    random_generator(random_index, pubkeyCount, num_addresses);
    
    cout << "start to find path" << endl;
    auto start_clock = chrono::high_resolution_clock::now();
    
    uint32_t random_results = random_testFindPath(chain, random_index, num_addresses, dest_addrs);

    auto end_clock = chrono::high_resolution_clock::now();
    chrono::duration<double> diff = end_clock - start_clock;
    printf("Elapsed Time: %.9lf s\n", diff.count());
    printf("Number of positive results is %d\n", (int)random_results);
    float avg = diff.count()/num_addresses;
    printf("Average query time is %.9lf s\n", avg);

    return 0;
}
