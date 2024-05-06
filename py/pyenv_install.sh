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
