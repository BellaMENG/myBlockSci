from test_clustering import *
import time
import tempfile as tmpdir_factory

chain = blocksci.Blockchain('/home/zmengaa/blocksci.config', 600000)

#tmpdir_factory = "/home/zmengaa/tmpdir"

start_time = time.process_time()
test_clustering_default_heuristic(chain, tmpdir_factory)
end_time = time.process_time()
print("--- test default heuristics: %s seconds ---" % (time.time() - start_time))

start_time = time.process_time()
test_clustering_proxy_heuristic(chain, tmpdir_factory)
end_time = time.process_time()
print("--- test default heuristics: %s seconds ---" % (time.time() - start_time))

