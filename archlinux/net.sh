#!/bin/bash
# network usage command
#
# show my ip address ipaddress, 
curl ifconfig.me
# show my ip to conuntry, GeoIP
curl ipinfo.io/<ip> # e.g. curl ipinfo.io/140.118.223.25

# domain / host to ip address
getent hosts google.com # or. getent ahostsv4 google.com # fist selection
host google.com  # default not installed
nslookup google.com

# network speed testing
pacman -S speedtest-cli
speedtest-cli
##############################################################################################################
# cat /proc/net/dev # show network throughput, Packets number
##############################################################################################################
# format output /proc/net/dev
# 打印表头
printf "%-12s %12s %12s %8s %8s %8s %8s %12s %12s %12s %8s %8s %8s %8s\n" \
  "Interface" "RX MB" "RX Packets" "RX Errs" "RX Drop" "RX FIFO" "RX Frame" "RX Comp" "RX Multicast" \
  "TX MB" "TX Packets" "TX Errs" "TX Drop" "TX FIFO"

# 打印分隔线
printf "=============================================================================================\n"

# 使用 awk 处理数据并格式化输出
awk 'NR > 2 {
  rx_mb = $2 / 1024 / 1024; # 将接收字节数转换为MB
  tx_mb = $10 / 1024 / 1024; # 将传输字节数转换为MB
  printf "%-12s %12.2f %12s %8s %8s %8s %8s %12s %12s %12s %8s %8s %8s %8s\n", $1, rx_mb, $3, $4, $5, $6, $7, $8, $9, tx_mb, $11, $12, $13, $14
}' /proc/net/dev
##############################################################################################################

