# General linux command

# find
find . -type f -size -4096c # find size smaller than 4096 bytes.
find . -type f -size +2k    # larger than 2*1024 bytes.
find . -type f -size +2M    # larger than 2 Megabytes.

# zip, unzip
unzip "*.zip" -d dir   # unzip all file to <dir>, quote is need for *
unzip -O big5 file.zip # unzip traditional chinese archive 繁體中文解壓縮


# cut usage
echo "aaa bbb ccc" |cut -d' ' -f 2 # use ' ' separator instead of tab, select 2nd col ('bbb')

# awk usage
"                    file: information.txt:
fristName       lastName        age     city       ID

Thomas          Shelby          30      Rio        400
Omega           Night           45      Ontario    600
Wood            Tinker          54      Lisbon     N/A
Giorgos         Georgiou        35      London     300
Timmy           Turner          32      Berlin     N/A
"
awk '{print $0}' information.txt     # full txt
awk '{print NR,$0}' information.txt  # with line number
awk '{print $NF}' information.txt    # last only
awk '{print $1, $4}' information.txt # 1,4 columns

awk '/^O/' information.txt   # show line start with 'O'
awk '/0$/' information.txt   # line end in a '0'
awk '! /0$/' information.txt # line not end in a '0'

awk ' /io/{print $0}' information.txt    # line contain 'io'
awk '/io/{print $1, $2}' information.txt # above see only 1,2 columns

awk -F"\t" '{print $1, $2}' information.txt # set separator
awk '$3 < 40 { print $0 }' information.txt  # selection 3th column < 40

who | awk 'BEGIN {print "Active Sessions"} {print $1,$4}'

awk 'BEGIN { print sqrt(625)}'
awk 'BEGIN {print atan2(0, -1)}'
awk 'BEGIN {printf "%.2f", 0.13+0.32}' # round off result

# grep usage
ss |grep -i "tcp" # -i:ignore find line contain "tcp" or "TCP"
ss -tuap |grep -o "fd=[0-9]\+" # find and show only the pattern

