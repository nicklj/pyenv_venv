# Configuration in MacOS Sonoma 14.6
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

## Install pre-requisite
```bash
brew install xz
```

## Check version and install Python (version 3.10.14 as example)
```bash
pyenv --version
#pyenv install 3.10.14
CFLAGS="-I$(brew --prefix xz)/include" LDFLAGS="-L$(brew --prefix xz)/lib" pyenv install 3.10.14
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

# Install torch and torch_geometric
## Install torch and torch_geometric(from source)
```bash
pip install wheel
pip install torch torchvision torchaudio
pip install --no-use-pep517 --verbose git+https://github.com/pyg-team/pyg-lib.git
pip install --no-use-pep517 torch_scatter torch_sparse torch_cluster torch_spline_conv torch_geometric
```
## Code revision for working on MacOS
In the code, set the device to `mps` instead of `cuda` for using M1/2/3's GPU. Somethings needs to be careful:
- When load a checkpoint from early stored by using cuda, need to add `map_location="mps"`
- The mps backend does not support `float` (float64), so remember to convert all `float` to `float32`
- The mps backend does not support autocast: `torch.amp.autocast`. So when writing code, be careful to handle the data type properly.

# Install Open3D
We need to compile Open3D from source
ref:  https://www.open3d.org/docs/latest/compilation.html

## Activate the desired virtual environment
Check `which python` to ensure that it shows the desired Python executable.
This step is very important. It determines which env to install the open3d

## Clone Open3D
```bash
git clone https://github.com/isl-org/Open3D
```

## Configure
```bash
mkdir build
cd build
cmake ..
```
You can specify `-DCMAKE_INSTALL_PREFIX=$HOME/opt/open3d` to control the installation directory of `make install`.
```bash
# Build
make -j4

# Install
make install

# Install pip package in the current python environment
make install-pip-package

# Create Python package in build/lib
make python-package

# Create pip wheel in build/lib
# This creates a .whl file that you can install manually.
make pip-package
```
