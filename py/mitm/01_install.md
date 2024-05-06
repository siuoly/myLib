```sh
pacman -S mitm
python: mitmproxy、mitmdump、mitmweb
mitmdump --version # script
```

# certificate
## chrome
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --proxy-server=127.0.0.1:8080 --ignore-certificate-errors

## firefox
configure firefox to use http proxy: localhost port 8080 ( you can use foxyproxy ) \
visit http://mitm.it/ then click windows icon to download the certificate \
follow the How to install on Windows instructions that appears after clicking the icon \
after that go firefox options => privacy & security => view certificates => click import and select the downloaded certificate \
`path`:/home/siuoly/.mitmproxy

## foxyproxy
proxies tab:
add
Title:mitm
Type:HTTP
Hostname:localhost
Port:8080
Pattern: http://mitm.it/
用 F12 查看 流量來源IP, 將其加入 foxyproxy 

vim: nospell foldlevel=99

