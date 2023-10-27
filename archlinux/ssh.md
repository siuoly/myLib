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

