# Configuration in Windows
## Set policy for executing script in PowerShell
```
Set-ExecutionPolicy Unrestricted -Scope Process
```
If you have admin, simply run below (to avoid input this every time)
```
Set-ExecutionPolicy Unrestricted -Force
```

## Install pyenv
Ref: https://github.com/pyenv-win/pyenv-win

```
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
```

## Check version and install Python (version 3.8 as example)
```
pyenv version
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
$HOME/venv/base/Scripts/Activate.ps1
```

## Install necessary packages
```
pip install matplotlib jupyterlab pandas 
```

## Install pytorch (if needed)
```
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
```

## Setting in Windows Terminal
- Open Windows Terminal
- Press Ctrl + , to open settings
- Click "Open JSON file" (Usually on the bottom left corner)
- Add below to the "profiles" section
```
{
    "commandline": "powershell.exe -ExecutionPolicy ByPass -NoExit -Command & '%USERPROFILE%\\venv\\base\\Scripts\\Activate.ps1' ",
    "guid": "{881ffddd-46e3-4a9e-9aba-93e214d98761}",
    "hidden": false,
    "name": "PyEnv Powershell",
    "startingDirectory": "%USERPROFILE%"
},
```

## Setup utility script for achieving similar experience as anaconda
- Download the script from [setpyenv.ps1](utils/setpyenv.ps1)
- Put the file in your any folder, e.g. $HOME/bin
- Add the folder to your PATH environment variable
- Then you can use below command to activate/change/deactivate your environment (Change YOUR_ENV_NAME to your environment name, say *base*)
```
setpyenv YOUR_ENV_NAME
setpyenv deactivate
```

## Other notes
- VSCode cannot find the location of virtual env automatically. Need to specify the location when you open your python project.

