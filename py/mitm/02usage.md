# mitm
## testing 
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Dunedin?0"
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Taipei?0"
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Innsbruck?0"
curl --proxy localhost:8080  --insecure https://upload.wikimedia.org/wikipedia/zh/f/fc/%E5%8E%9F%E7%A5
%9E_%E5%9C%8B%E9%9A%9B%E7%89%88.jpeg
curl --proxy localhost:8080  --insecure https://example.com

## keybinding
E: event, q:back (show pory)
w: save session
L: load session
o: order
f: filter (不用手動加入'引號')
F: follow new (遊標自動移至最新目標）
Q: exit immediately
v: view flow req/res in the window.

## filter:
~u google # url
~m get    # method

## server-side replay
1. from flow
change response of the indicated flow , 
type `S`: replay.server @focus, or @all @marked ...
then resend request(curl..), get the changed response
2. from file
type `w` save flows to file,
`mitmproxy -S <dump file>`
or `:replay.server.file <dump file>`
then capture the set it to replay file.

>> 
  replay.server : set flows to replay
  replay.server.add : add new flow to replay
  replay.server.count : return number of flow to replay
  replay.server.file : indicated file to replay
  replay.server.stop : clear all flow prepared to replay

## Other 
把抓到的 webp response 保存，砍去標題，即可讀取查看

vim: nospell foldlevel=99
