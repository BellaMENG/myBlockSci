#include <iostream>
#include <fstream>
#include <vector>
#include <map>
#include <unordered_set>
#include <algorithm>

using namespace std;

typedef std::multimap<int64_t, int64_t>::iterator MMAPIterator;

void sortList() {
    std::multimap<int64_t, int64_t> mmap;
    std::unordered_set<int64_t> idSet;
    
    ifstream ifs("sortedList1.txt");
    int64_t a, b;
    int64_t minId = 0, maxId = 0;
    while(ifs >> a >> b) {
        idSet.insert(a);
        mmap.insert(std::pair<int64_t, int64_t>(a, b));
        if (a > maxId)
            maxId = a;
    }
    cout << maxId << endl;

    vector<int64_t> edgeList;
    for (int64_t i = minId; i <= maxId; ++i) {
        if (idSet.find(i) == idSet.end())
            continue;
        std::pair<MMAPIterator, MMAPIterator> result = mmap.equal_range(i);
        vector<int64_t> vertices;
        for(MMAPIterator it = result.first; it != result.second; it++) {
            vertices.push_back(it->second);
        }
        sort(vertices.begin(), vertices.end());
        for(vector<int64_t>::iterator it = vertices.begin(); it != vertices.end(); ++it) {
            edgeList.push_back(i);
            edgeList.push_back(*it);
        }
    }

    ofstream ofs;
    ofs.open("sortedV2.txt");
    for (vector<int64_t>::iterator it = edgeList.begin(); it != edgeList.end(); it += 2) {
        ofs << (*it) << " " << (*(it+1)) << "\n";
    }
}


int main() {
    sortList();
    return 0;
}
