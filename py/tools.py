# sys.path.append("xxx") # 添加新路徑，且pyright找到的方法
"""
env variable append following:
PATHONPATH+="/aa/bb/cc/your_path/:"
"""

##########################################################
try:
    from icecream import ic,install
    def ic_output_string(obj): return repr(obj)[:180]
    ic.configureOutput(argToStringFunction=ic_output_string, includeContext=True, prefix="[TODO] ")
except ImportError:  # Graceful fallback if IceCream isn't installed.
    ic = lambda *a: None if not a else (a[0] if len(a) == 1 else a)  # noqa

# example
a="good"
def foo():
    ic(a) # show 'a' line, function, variable repr
    return 132
###########################################################
def chuncks(iterable, n):  # batch, chunck itertools
    for i in range(0, len(iterable), n):
        yield iterable[i : i + n]


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
from time import perf_counter


class Timer:
    def __init__(self, m="", file=None) -> None:
        self.m = m
        self.file = file

    def __enter__(self):
        self.s = perf_counter()

    def __exit__(self, exc_type, exc_val, exc_tb):
        end = perf_counter()
        print(f"{self.m} {end-self.s} sec", file=self.file)
