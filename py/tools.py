def chuncks(iterable, n): # batch, chunck itertools 
    for i in range(0,len(iterable),n):
        yield iterable[i:i+n]
"""
a = list(range(100))
for c in chuncks(a,13):
    print( c )
"""

# show my code of traceback only
"""
pip install pretty_errors
python3 -m pretty_errors # install it for all environment
/home/siuoly/.local/lib/python3.8/site-packages/usercustomize.py:
------
    pretty_errors.blacklist("/home/siuoly/.local/lib/python3.8/site-packages/")
    pretty_errors.configure(
        filename_display          = pretty_errors.FILENAME_FULL,# pretty_errors.FILENAME_COMPACT,  # FILENAME_EXTENDED | FILENAME_FULL,
        line_color                = '  \x1b[1;37m',
        name = "custom"  # name it whatever you want
    )
"""
