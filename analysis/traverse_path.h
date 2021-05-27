#include "util.hpp"
#include <string>
#include <queue>
#include <fstream>
#include <chrono>
#include <time.h>

void printAddressFromString(Blockchain &chain, string address);
void printOutputs(Blockchain &chain, string address);

bool findPath(Blockchain &chain, string src, string dest);
bool findPathGroups(Blockchain &chain, string src, unordered_set<Address> dests);

void read_addresses(Blockchain& chain, string file_path, int& num_addrs, unordered_set<Address>& addresses);

void getAddrFromScriptNum(Blockchain& chain, uint32_t addressNum, AddressType::Enum type, DataAccess &access);

bool findPathRaw(Address& src, unordered_set<Address>& dests);
uint32_t testFindPath(Blockchain &chain, uint32_t start, uint32_t pubkeyCount, unordered_set<Address>& dests);

uint32_t even_testFindPath(Blockchain &chain, uint32_t start, uint32_t pubkeyCount, uint32_t step, unordered_set<Address>& dests);

uint32_t random_testFindPath(Blockchain &chain, unordered_set<uint32_t>& random_index, uint32_t count, unordered_set<Address>& dests);

void random_generator(unordered_set<uint32_t>& random_numbers, uint32_t range, uint32_t size);
