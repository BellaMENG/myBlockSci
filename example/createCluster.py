import blocksci

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config', 200000)
cm = blocksci.cluster.ClusterManager('./clusters20k', chain)

print(len(cm.clusters()))
#cm = blocksci.cluster.ClusterManager('./clusterManager', chain)


