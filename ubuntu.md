# Configuration in Ubuntu 20.04
## Install pyenv
```
curl https://pyenv.run | bash
```

## Configure in .bashrc
```
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

## Restart shell

## Check version and install Python (version 3.8 as example)
```
pyenv --version
pyenv install 3.8.10
pyenv global 3.8.10
python -c "import sys; print(sys.executable)"
```

## Install virtual env with venv
A good practice is to create a "venv" folder in your home folder, then create separate environment inside this folder.
**It is recommended to use below setting for aligning with the provided setpyenv script.**
```
python -m venv $HOME/venv/base
```
Note that the folder name will be used as the env prompt name.
The *base* env is named following the default one of anaconda. You may change to anything you like, and create as many environments as you like.

## Activate environment
```
source $HOME/venv/base/bin/activate
```

## Install necessary packages
```
pip install matplotlib jupyterlab pandas 
```

## Install pytorch (if needed)
```
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
```

## Setup utility script for achieving similar experience as anaconda
You may choose one of the following methods for this implementation:
- Add the content in [setupenv.sh](utils/setupenv.sh) to your *.bashrc*
- Alternatively, put the file [setupenv.sh](utils/setupenv.sh) in your any folder, e.g. *$HOME/bin*, and add below in *.bashrc* as
```
source $HOME/bin/setupenv.sh
```
Then you can use below command to activate/change/deactivate your environment (Change YOUR_ENV_NAME to your environment name, say *base*)
```
setpyenv YOUR_ENV_NAME
setpyenv deactivate
```

## Other notes
- VSCode cannot find the location of virtual env automatically. Need to specify the location.



