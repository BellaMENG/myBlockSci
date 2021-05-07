import blocksci

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config')
addrs = chain.most_valuable_addresses()
