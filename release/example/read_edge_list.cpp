#include <iostream>
#include <fstream>

using namespace std;

void read_edge_list() {
    ifstream ifs("edge_list60k.txt");
    int64_t a, b;
    int64_t max;
    while(ifs >> a >> b) {
        if (a > max)
            max = a;
        if (b > max)
            max = b;
    }
    cout << "max idx is: " << max << endl;
}

int main() {
    read_edge_list();
    return 0;
}
