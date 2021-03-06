#include "index_addresses.hpp"
#include "util.hpp"

void index_addresses(int argc, const char * argv[]) {
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
                // check how to cout the uint256
                cout << " tx_index: " << tx_index << "; tx_hash: " << tx.getHash().GetHex();
            }
            tx_index += 1;
        }
        block_index += 1;
        if (block_index > 1030)
            break;
    }

    std::cout << "Chain contains:" << std::endl;
    std::cout << block_index + 1 << " blocks" << std::endl;
    std::cout << tx_index + 1 << " transactions" << std::endl;
    std::cout << inputCount << " inputs" << std::endl;
    std::cout << outputCount << " outputs" << std::endl;
}

