#include "util.hpp"
#include "traverse_path.h"
#include <string>
#include <queue>
#include <fstream>
#include <chrono>

//__constant__ Blockchain chain;
//__constant__ unordered_set<Address> dest_addrs;

int main(int argc, const char* argv[]) {
    string chain_fp = argv[1];
    string dest_addr_file_path = argv[2];
    int num_addresses = stoi(argv[3]);
    Blockchain h_chain(chain_fp);

    return 0;
}
