import blocksci
import time

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config')
print("start")
start_time = time.process_time()
addrs = chain.most_valuable_addresses()
end_time = time.process_time()

print("--- %s seconds ---" % (time.time() - start_time))
