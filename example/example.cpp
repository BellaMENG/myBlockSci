
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

using namespace blocksci;

int main(int argc, const char * argv[]) {
    
    Blockchain chain(argv[1]);

    int64_t block_index = 0;
    int64_t tx_index = 0;
    int64_t inputCount = 0;
    int64_t outputCount = 0;
    
    for (auto block : chain) {
        RANGES_FOR(auto tx, block) {
            inputCount += tx.inputCount();
            outputCount += tx.outputCount();
            if (1000 <= block_index < 1030) {
                cout << " tx_index: " << tx_index << "; tx_hash: " << tx.hash;
            }
            tx_index += 1;
        }
        block_index += 1;
        if (block_index > 1030)
            break;
    }

    std::cout << "Chain contains:" << std::endl;
    std::cout << blockCount << " blocks" << std::endl;
    std::cout << txCount << " transactions" << std::endl;
    std::cout << inputCount << " inputs" << std::endl;
    std::cout << outputCount << " outputs" << std::endl;

    return 0;
}
