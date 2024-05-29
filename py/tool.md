
## pyenv install
```sh
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
exec "$SHELL"

pyenv install 3.10.4
pyenv virtualenv 3.10.4 default
pyenv global default

 # import _tkinter # If this fails your Python may not be configured for Tk
pacman -S tk
```

## conda
```sh
wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh # download install script
conda --version # -V ,show version
conda update conda # or anaconda , python
conda update # for all packages
conda upgrade --all # also update dependency

conda list # show packages of current env
conda list -n "env_name" # show other env pkgs

conda install <pkg>
conda install <pkg>==<version>
conda install -n "env_name" <pkg>
conda install --yes --file requirement.txt
conda uninstall <pkg>
conda remove -n "env_name" "pkg_name" # remove pkg from env

conda env list
conda info -e
conda create -n "env_name" # -n: --name
conda create -n "env_name" python=X.X # e.g. 3.9, 3.7
conda env create -f "envfile.yml"
conda env create # using environment.yml the current folder
conda env remove -n "env_name"

conda activate "env_name"
source activate "env_name" # same above
conda deactivate
source deactivate "env_name" # same above

conda config --set auto_activate_base false # disable shell prompt
conda init --reverse $SHELL # undo

 # others
conda install pytorch==2.0.1 pytorch-cuda=11.8 -c pytorch -c nvidia  ## install torch command
```

## torch install
1. `pip install torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2 --index-url https://download.pytorch.org/whl/cu118` newest version
2. install by requirement.txt with indicated url
```txt
 # requiremet.txt
torch==1.12.1+cu116
torchvision==0.13.1+cu116
torchaudio==0.12.1
```
`pip install -r requirement.txt --extra-index-url https://download.pytorch.org/whl/cu116`

3. `pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu116` equal above


## colab
### run file .ipynb file from github
https://github.com/amoliu/CayleyNet/blob/master/CayleyNet.ipynb -->
https://githubtocolab.com/amoliu/CayleyNet/blob/master/CayleyNet.ipynb
> change domain "github" to "githubtocolab"
### import project files
!git clone https://github.com/amoliu/CayleyNet.git
%cd CayleyNet
<!-- import sys; sys.path.insert(0,"CayleyNet") -->
> clone the project and change the folder for importing python files

## http server
```sh
python3 -m http.server 3333 # port 3333
python3 -m http.server --bind 127.0.0.1
```
