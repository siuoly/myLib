# config
git config --list
git config --global --list
git config --local --list
git config --global --edit   # ~/.gitconfig    
git config --local --edit    # <YourRepository>/.git/config

git config pull.rebase false # merge
git config pull.rebase true # rebase
git config pull.ff only # fast-forward only

# pull
## merge 系列
git pull --rebase=false # 合併，遠端的commit 會比本地更新，再加入一個merge的訊息commit
git fetch && git merge  # 和上方同等
git pull --ff          # 和上方同等
## ff only 系列
git pull --ff-only # 不會自動合併檔案，會報錯
## rebase 系列
git pull --rebase  # -r , 本地的 commit 移動至最新，其前一步插入遠端 commit
## 以後pull遇到衝突，用 git pull --ff 是最快的辦法


