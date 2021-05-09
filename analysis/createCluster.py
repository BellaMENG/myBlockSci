import blocksci
import time

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config', 600000)

cm = blocksci.cluster.ClusterManager.create_clustering('/home/zmengaa/clusters60k', chain)

print(len(cm.clusters()))
#cm = blocksci.cluster.ClusterManager('./clusterManager', chain)


