#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;


bool sortcol(const vector<int>& v1, const vector<int>& v2) {
    return v1[0] < v2[0];
}

void sortVecs() {
    vector<vector<int>> edgeList1;
    ifstream file1("edgeList1.txt");
    int a, b;
    while(file1 >> a >> b) {
        vector<int> edge;
        edge.push_back(a);
        edge.push_back(b);
        edgeList1.push_back(edge);
    }
    
    vector<vector<int>> edgeList2;
    ifstream file2("edgeList2.txt");
    
    while(file2 >> a >> b) {
        vector<int> edge;
        edge.push_back(a);
        edge.push_back(b);
        edgeList2.push_back(edge);
    }
    sort(edgeList1.begin(), edgeList1.end(), sortcol);
    sort(edgeList2.begin(), edgeList2.end(), sortcol);
    
    ofstream of1;
    of1.open("sortedList1.txt");
    for(int i = 0; i < edgeList1.size(); ++i) {
        of1 << edgeList1[i][0] << " " << edgeList1[i][1] << "\n";
    }
    of1.close();
    ofstream of2;
    of2.open("sortedList2.txt");
    for(int i = 0; i < edgeList2.size(); ++i) {
        of2 << edgeList2[i][0] << " " << edgeList2[i][1] << "\n";
    }
    of2.close();
}

void convertEL() {

    flat_hash_set<std::pair<int64_t, int64_t>> edgeSet;
    ifstream myfile("edge_list.txt");
    int a, b;
    while(myfile >> a >> b) {
        std::pair<int64_t, int64_t> edgepair;
        if (a > b) {
            edgepair.first = b;
            edgepair.second = a;
        } else if (a < b) {
            edgepair.first = a;
            edgepair.second = b;
        }
        edgeSet.insert(edgepair);
    }

}


void createNConvert() {
    vector<int> edgeList1;
    vector<int> edgeList2;

    ifstream myfile("edge_list.txt");
    int a, b;
    while(myfile >> a >> b) {
        if (a < b) {
            edgeList1.push_back(a);
            edgeList1.push_back(b);
        }
        if (a > b) {
            edgeList2.push_back(a);
            edgeList2.push_back(b);
        }

    }

    cout << edgeList1.size() << endl;
    cout << edgeList2.size() << endl;
    ofstream of1;
    of1.open("edgeList1.txt");

    for (int i = 0; i < edgeList1.size()-1; i+=2) {
        of1 << edgeList1[i] << " " << edgeList1[i+1] << "\n";
    }
    of1.close();
    ofstream of2;
    of2.open("edgeList2.txt");

    for (int i = 0; i < edgeList2.size()-1; i+= 2) {
        of2 << edgeList2[i] << " " << edgeList2[i+1] << "\n";
    }
    of2.close();
}

int main() {
    sortVecs();
    return 0;
}
