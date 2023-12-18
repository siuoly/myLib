# https://azole.medium.com/docker-container-%E5%9F%BA%E7%A4%8E%E5%85%A5%E9%96%80%E7%AF%87-1-3cb8876f2b14
# 第一次加入 user group
sudo usermod -aG docker <USER>
# 查看 docker 版本
docker --version
docker version

# 查看 docker 系統資訊
docker info

# 從 node:20 image 啟動一個 docker container 並開啟輸出入
docker container run -it node:20 /bin/bash

# 查看目前正在運行中的 container
docker container ls

# 查看全部的 container，包括已經停止的。 (a -> all)
docker container ls -a

# 從 DockerHub 上拉下版本為 18 的 node image
docker image pull node:18

# 查看目前環境中的 docker images
docker image ls

# 用 container id 為 4c9bee8fef4b 的 container 
# 建立一個叫做 node:20-updated 的 image
docker container commit 4c9bee8fef4b node:20-updated

# 查看 node:20 這個 image 的歷史
docker image history node:20

# 停止 4c9bee8fef4b 這個 contaienr 
docker container stop 4c9bee8fef4b

# 啟動 4c9bee8fef4b 這個 container
docker container start 4c9bee8fef4b

# 在 4c9bee8fef4b 這個 container 中執行 /bin/bash 這個命令，並且開啟輸出入
# 因為是執行 /bin/bash 又開啟了輸出入，所以就像是「進入」了這個 container 中
docker container exec -it 4c9bee8fef4b /bin/bash

# 移除 4c9bee8fef4b 這個 container
docker container rm 4c9bee8fef4b
# docker rm 4c9bee8fef4b

# 移除所有停止的 containers
docker container prune -f

# 移除 node:18 這個 image
# 移除 image 前要先移除用這個 image 啟動的 containers
docker image rm node:18
