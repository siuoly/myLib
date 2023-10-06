import time
from functools import lru_cache
from joblib import Memory

def count_cost_time(func):
    start = time.time()
    for i in range(1000):
        func(123)
    end = time.time()
    print( f"cost {end-start:.2f} sec.")

### 1st
def cost_operation(x):
    time.sleep(0.01) #  10 ms time cost computation
    return x
count_cost_time(cost_operation)

### 2nd, memory cache
@lru_cache
def cost_operation2(x):
    time.sleep(0.01) #  10 ms time cost
    return x
count_cost_time(cost_operation2)

### 3rd, memory + disk cache
cache = Memory(location="./cache_folder",verbose=0)
@lru_cache  # first check memory cache
@cache.cache  # then check disk cache
def cost_operation3(x):
    time.sleep(0.01) #  10 ms time cost
    return x
count_cost_time(cost_operation3)

