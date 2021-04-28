import blocksci
import time
from collections import Counter

def calculateBlockBals(block):
    balances = Counter()
    addresses = list(block.outputs.unspent.address)
    values = list(block.outputs.unspent.value)
    
    for idx in range(len(addresses)):
        
        addr_type = int(addresses[idx].type)
        
        if addr_type in [0,6]:
            continue
        elif addr_type == 5:
            addr = str(addresses[idx].addresses)
        else:
            addr = addresses[idx].address_string
            
        if addr in balances:
            balances[addr] = balances[addr] + (values[idx] / 1e8)
        else:
            balances[addr] = values[idx] / 1e8
        
    return balances

def calculateAllBals(chain):
    def mapFunc(block):
        return [calculateBlockBals(block)]

    def reduceFunc(x, y):
        return x + y
    
    parts = chain.mapreduce_block_ranges(mapFunc, reduceFunc, cpu_count=14)
    return parts


chain = blocksci.Blockchain('/home/zmengaa/blocksci.config')
start_time = time.process_time()
data = calculateAllBals(chain)
end_time = time.process_time()

print("--- %s seconds ---" % (time.time() - start_time))
