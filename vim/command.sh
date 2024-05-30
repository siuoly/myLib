# filter command output
:filter/toggle/map # search command map output
:filter/\cluasnip/scriptnames # \c:search ignorecase "luasnip" in scriptnames output

# get command output to filter
redir @a # dump output to register "a"
silent! set all
redir END 

redir =>a # dump to variable a

# get command output to filter
put=execute('nmap')
<c-r> =put("nmap") # insert mode

# compute Hexadecimal to decimal number 16進位
<c-r> =0x0539 # get 1337

# translate encodeing big5 to utf-8
:e ++enc=big5 # or gbk for zh_cn
:se fenc=utf-8
:w
