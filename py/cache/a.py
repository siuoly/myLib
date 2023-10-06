
# compute ,
# save
# if fiel exist
# open read the file

import os
import pickle
from functools import cache,lru_cache
def save(func):
    file = 1
    def new_func(x):
        if os.path.exists(file):
            print( "load feature" )
            with open(file,'rb') as f:
                feature = pickle.load(f)
            return f
        else:
            feature = func(x)
            with open(file,'wb') as f:
                pickle.dump(feature,f)
            print( "save feature" )
    return new_func
    
import time
@lru_cache
def compute(x):
    return sum(x)

print( "start" )
print( compute((1,2,3)) )
print( compute((1,2,3)) )
print( compute((1,2,3)) )

