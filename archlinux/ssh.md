# generate key
ssh-gen -t rsa

# copy public-key
ssh-copy-id -i <my-public-key> -p <port> <Destination>


# X11 forwarding, enable remote clipboard
edit: ~/.config/ssh
```
HOST *
  ForwardAgent yes
  ForwardX11 yes
  ForwardX11Trusted yes # must
```

# ssh server speed too slow, ssh connection speed slow
    Laggy SSH sessions on local network: https://askubuntu.com/questions/438862/ssh-working-so-slow?newreg=1c93b9ca58a245e6b54f34ae4483b1b9
In server host, do
`sudo iw <ADAPTER> set power_save off`

# X11 server forwarding DISPLAY
edit: /etc/ssh/sshd_config
    X11Forwarding yes
systemctl restart sshd

# remote folder mount sshfs
sudo pacman -S sshfs
mkdir MOUTN_DIR
sshfs NAME@HOST:/path/to/folder MOUTN_DIR

fusermount -u MOUTN_DIR # unmount directory

# rsync backup
    > https://blog.gtwang.org/linux/rsync-local-remote-file-synchronization-commands/#%E9%A1%AF%E7%A4%BA%E5%82%B3%E8%BC%B8%E9%80%B2%E5%BA%A6
pacman -S rsync
rsync --progress -vazh -e 'ssh -p 2222' SOURCE REMOTE:DIST

# mosh usage
note: true color need mosh version > 1.4, pacman is ok, but ubuntu need compile manually
note: both client and server side need to install mosh
```sh
mosh --ssh="ssh -p PORT" -p UDP_USE_PORT USER@HOST
mosh USER@HOST  # default create connection on udp 600001 port
```
## mosh enable clipboard by osc52
1. xst config.h: int allowwindowops = 1;
2. nvim install **nvim-osc52** plugin, change default clipboard provider.

    > ref: https://www.reddit.com/r/suckless/comments/1715wey/does_st_support_osc_52/
    > https://www.reddit.com/r/vim/comments/k1ydpn/a_guide_on_how_to_copy_text_from_anywhere/
    > https://github.com/ojroques/nvim-osc52

## ssh remote server as proxy
```sh
ssh -N -f -D 8081 user@host 
-D 8081 指的是將通往 8081 port 的連線轉往 SSH 伺服器
-N 不執行任何遠端指令(remote command)，通常 port forwarding 都會使用 -N
-f 在背景執行連線
```
firefox --> setting --> General --> Network Settings
Manual proxy configuration:
    SOCKS Host: 127.0.0.1 Port:8081
    - SOCKS v5

## ssh reverse port forwarding
```sh
ssh -NfR R_port:L_ip:L_port   [R_USER@]R_ip
# any --> R_ip:R_port --> L_ip:L_port
# R --> R_ip(localhost):R_port --> L_ip:L_port
# R: remote_host
# L: local_host

## e.g. make remote server behind NAT linkable
Remote$  ssh -NfR 7777:localhost:22 client
client$  ssh -p 7777 localhost # link to localhost:7777 , forward to Remote port 22 which is ssh server

## e.g. make web server linkable by another remote which is reachable by public network
WebServer$  ssh -NFR 443:localhost:3030 Remote # web open port at localhost 3030
Any$ brower to Remote:443(https) # packet is forward transfer to WebServer:3030 which is web service
```
Ref:
ssh將NAT背後的區域網路開放給外部使用： https://hackmd.io/@DailyOops/ssh-reverse-tunnel-behind-the-router-with-socks5-proxy
ssh tunneling 教學,開放透過遠端機器開放NAT背後的web server：https://goteleport.com/blog/ssh-tunneling-explained/



vim: nospell :

