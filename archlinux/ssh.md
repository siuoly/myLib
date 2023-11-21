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


vim: nospell :

