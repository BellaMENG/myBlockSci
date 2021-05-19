#include "util.hpp"
#include <string>


void printAddressFromString(Blockchain &chain, string address) {
    auto randomAddress = getAddressFromString(address, chain.getAccess());
    if (randomAddress) {
        cout << "scriptNum:" << randomAddress->scriptNum << endl;
        cout << "type: " << randomAddress->type << endl;
    }
}


int main(int argc, const char* argv[]) {
    
    string chain_fp = argv[1];
    
    Blockchain chain(chain_fp);
    cout << "here" << endl;
    string addr = "3PXswrSTz7tW73BKFcU8GENGFtoagKUJP3";
    cout << "here" << endl;
    printAddressFromString(chain, addr);
    
    return 0;
}
