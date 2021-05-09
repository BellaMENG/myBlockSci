import blocksci

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config', 600000)
cm = blocksci.cluster.ClusterManager('/home/zmengaa/clusters60k', chain)

print(len(cm.clusters()))
#cm = blocksci.cluster.ClusterManager('./clusterManager', chain)


