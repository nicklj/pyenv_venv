export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source $HOME/venv/base/bin/activate

## Add as many as you like for quick switching environments
# alias setbase='source $HOME/venv/base/bin/activate'

## Unset pyenv and remove it from the path
alias unsetpy='deactivate && export PATH=$(echo $PATH | tr ':' '\n' | egrep -v pyenv | paste -sd:)'

# Define setpyenv function for quick switching environments
setpyenv() {
    local arg="$1"

    # If no arg is given, return an error
    if [[ -z "$arg" ]]; then
        echo "Please specify an environment to activate."
        echo "Activate/Change env: setpyenv <environment>"
        echo "Deactivate: setpyenv deactivate"
        return 1
    fi

    # If the arg is "deactivate", then deactivate the current environment
    if [[ "$arg" == "deactivate" ]]; then
        deactivate
        export PATH=$(echo $PATH | tr ':' '\n' | egrep -v pyenv | paste -sd:)
        return 0
    fi

    # Define the base path where the virtual environments are located
    basePath="$HOME/venv" 
    scriptToRun="$basePath/$arg/bin/activate"

    # Check if the file exists and is executable
    if [[ -f "$scriptToRun" ]]; then
        # Execute the script
        . "$scriptToRun"
    else
        echo "The script '$scriptToRun' does not exist or is not executable."
        return 1
    fi
}