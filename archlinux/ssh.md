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


vim: nospell :
