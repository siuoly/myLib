#!/bin/bash
# network usage command
nmtui
nm-connection-editor # edit network setting
nmcli radio wifi on
nmcli radio wifi off
nmcli device wifi rescan

# show my ip address ipaddress, 
curl ifconfig.me
# show my ip to conuntry, GeoIP
curl ipinfo.io/<ip> # e.g. curl ipinfo.io/140.118.223.25

# domain / host to ip address dns lookup
getent hosts google.com # or. getent ahostsv4 google.com # fist selection
host google.com  # default not installed
nslookup google.com


# network speed testing ,network speed monitor
yay -S speedtest-cli bmon iftop
speedtest-cli      # show network speed loading
bmon [-p <adaptor>]   # show adaptor usage history graph
sudo iftop -i <adaptor> # show each connection usage

############################################################################################################
# setup L2TP IPsec VPN in archlinux using NetworkManager
# from https://gist.github.com/pastleo/aa3a9524664864c505d637b771d079c9
pacman -S networkmanager-l2tp strongswan
nmcli c add con-name CON_NAME type vpn vpn-type l2tp vpn.data 'gateway=GATEWAY_HOST, ipsec-enabled=yes, ipsec-psk=PRE_SHARED_KEY, password-flags=1, user=USERNAME'
nmcli c edit CON_NAME # interactive mode, type help for manual
nmcli c up CON_NAME
nmcli c down CON_NAME
nmcli c delete CON_NAME
"
password-flags=0 => Save password in plain text
password-flags=1 => Save encrypted password
password-flags=2 => Don't save password, ask when needed when using this, nmcli c up CON_NAME --ask is needed 
"
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

#tool ifconfig
pacman -S net-tools

# show using ip port
sudo lsof -nPi
# -n: using numeric domain without dns transfered
# -P: using numeric port instead of service name(e.g. https->443)
# -i: show network file only,exclude general open files
