from argparse import ArgumentParser
import sys

#============
parser = ArgumentParser()
parser.add_argument("postional_arg1", help="positional argumant")
parser.add_argument("postional_arg2", help="identify argument by position")
parser.add_argument("--key_arg1", help="keywork argument")
parser.add_argument("--key_arg2", default="default_value_of key_arg2",
                    help="identify argument by keyword, if not identicate, value is None")
arg = parser.parse_args(["aaa",
                         "bbb",
                         "--key_arg1","k1"])
print("ex1:")
print( arg )
print("arg.postional_arg1:", arg.postional_arg1)
print()

#============= ip, port example
print("ex2:")
parser = ArgumentParser()
parser.add_argument("--ip", default="0.0.0.0",type=str, help="ip address")
parser.add_argument("--port",default=1234,  type=int, help="port number")
arg = parser.parse_args(["--ip","127.0.0.1", "--port","7777"])
print( "indicate", arg )
arg = parser.parse_args([])
print( "default", arg )

#============ 
def tab_printer(args):
    """
    Function to print the logs in a nice tabular format.
    :param args: Parameters used for the model.
    """
    from texttable import Texttable
    args = vars(args)
    keys = sorted(args.keys())
    t = Texttable()
    t.add_rows([["Parameter", "Value"]] + [[k.replace("_", " ").capitalize(), args[k]] for k in keys])
    print(t.draw())
tab_printer(arg)
#=========== argument
def get_argument(foo=None):
    p = ArgumentParser()
    # bool
    p.add_argument("--mixup",action="store_true",default=False)
    # int
    p.add_argument("--batch_size",type=int,default=64,)
    # float
    p.add_argument("--lr",type=float,default=1e-3,)
    # string
    p.add_argument("--backend",type=str,default="cos",choices=["softmax","cos","kmean"])
    # string choice
    p.add_argument("--log_dir",type=str, default="/runs/LR_{lr}__S_{s}__M_{m}")
    return p.parse_args(foo)
# n = get_argument(sys.argv)

