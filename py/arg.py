from argparse import ArgumentParser

#============
parser = ArgumentParser()
parser.add_argument("postional_arg1", help="identify argument by position")
parser.add_argument("postional_arg2", help="identify argument by position")
parser.add_argument("--key_arg1", help="identify argument by keyword")
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
