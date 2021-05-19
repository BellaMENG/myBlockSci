#include "util.hpp"
#include <string>


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
        RANGES_FOR(auto out, randomAddress->getOutputs()) {
            Address outAddr = out.getAddress();
//            if (outAddr != *randomAddress)
            cout << outAddr.toString() << endl;
        }
    }
}

bool findPath(Blockchain &chain, string src, string dest) {
    auto srcAddress = getAddressFromString(src, chain.getAccess());
    auto destAddress = getAddressFromString(dest, chain.getAccess());
    if ((!srcAddress) || (!destAddress)) {
        return false;
    }
    
    return true;
}

int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
    string addr = argv[2];
    Blockchain chain(chain_fp);
//    string addr = "3PXswrSTz7tW73BKFcU8GENGFtoagKUJP3";
//    printAddressFromString(chain, addr);
    printOutputs(chain, addr);
    return 0;
}
