import pandas as pd
import numpy as np

# multiple index, multiple level
cols=pd.MultiIndex.from_product( [['A','B'],['x','y']])
df=pd.DataFrame( np.random.randn(3,4), columns=cols)
print( df.to_string(index=False) )
df.loc[:,("A","y")]
df.loc[:,"A"]
df.loc[:,"y"] # error

# seriet string to label, label encoding 
def get_series_encode(series): # Label encoding pd.series data
    return series.astype("category").cat.codes.astype(int)
