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

# sed usage ref: https://www.hy-star.com.tw/tech/linux/sed/sed.html
##  例如我要把檔案〝MyFile.txt〞的 1~8 行中的〝The〞或〝the〞改為大寫的〝THE〞可如下:
sed -e '1,8 s/ [Tt]he/ THE/g' MyFile.txt
echo 'This is a bool'|sed 's/<is>/IS/g' # regular expression, This 不改變
df -h| sed -E 's/ +/,/g' # csv format output
echo "this is a apple"|sed -e 's/a/an' -e 's/apple/APPLE' # 多命令,也可用pipe完成
sed '3,$ s/^can/CAN/' file # 3~last line 開頭的can改爲大寫

# column usage # simple csv file format reader
column -s"," -t "<file>" |nvim

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
          # computation total install size(MiB only)
pacman -Qi  |awk '/^Name/{name=$3} /Installed Size/{print $4 $5, name}' |sort -h| grep MiB |awk '{size+=$1} END {printf "%.2fGiB", size/2^10}'


# e.g. awk parse time epoch format
"1702300527      3741.000        discharging
1702300557      3558.000        discharging
1702300587      3382.000        discharging
1702300617      3283.000        discharging
1702300647      3092.000        discharging " # /var/lib/history-time-empty.dat
awk '{print strftime("%F %T",$1) " "$2" "$3}' /var/lib/history-time-empty.dat

# grep usage
ss |grep -i "tcp" # -i:ignore find line contain "tcp" or "TCP"
ss -tuap |grep -o "fd=[0-9]\+" # find and show only the pattern
pacman -Qqe |grep -v "$(pacman -Qqm)" # -v inverse match, filter package, 
# enclose by "" make is interpret as string, otherwith it would be seen as many files
find -maxdepth 1 -type f|grep -v "\." |xarg rm # remove all executable file on the folder


# completion file for archlinux zsh
wget https://github.com/sxyazi/yazi/releases/download/v0.2.5/yazi-x86_64-unknown-linux-musl.zip 
unzup yazi-x86_64-unknown-linux-musl.zip
cd yazi-x86_64-unknown-linux-musl
sudo cp _ya _yazi /usr/share/zsh/site-functions  # put here, zsh completion file is without extension

