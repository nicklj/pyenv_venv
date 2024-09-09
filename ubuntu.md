# Configuration in Ubuntu 20.04
## Install pyenv
```bash
curl https://pyenv.run | bash
```

## Configure in your shell configuration file (.bashrc for Bash or .zshrc for Zsh)
```bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

## Restart shell or source the configuration file

## Check version and install Python (version 3.10.14 as example)
```bash
pyenv --version
pyenv install 3.10.14
pyenv global 3.10.14
python -c "import sys; print(sys.executable)"
```

## Install virtual env with venv
A good practice is to create a "venv" folder in your home folder, then create separate environment inside this folder.
**It is recommended to use below setting for aligning with the provided setpyenv script.**
```bash
python -m venv $HOME/venv/base
```
Note that the folder name will be used as the env prompt name.
The *base* env is named following the default one of anaconda. You may change to anything you like, and create as many environments as you like.

## Activate environment
```bash
source $HOME/venv/base/bin/activate
```

## Install necessary packages
```bash
pip install matplotlib jupyterlab pandas 
```

## Install pytorch (if needed)
```bash
# Install the latest stable version (always check the website which version installed)
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
# Install a specific version (say 1.13+cu117)
# pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
```

## Setup utility script for achieving similar experience as anaconda
You may choose one of the following methods for this implementation:
- Add the content in [setpyenv.sh](utils/setpyenv.sh) to your *.bashrc* or *.zshrc*
- Alternatively, put the file [setpyenv.sh](utils/setpyenv.sh) in your any folder, e.g. *$HOME/bin*, and add below in *.bashrc* or *.zshrc* as:
```bash
source $HOME/bin/setpyenv.sh
```
Then you can use below command to activate/change/deactivate your environment (Change YOUR_ENV_NAME to your environment name, say *base*)
```bash
setpyenv YOUR_ENV_NAME
setpyenv deactivate
```

## Other notes
- VSCode cannot find the location of virtual env automatically. Need to specify the location.



