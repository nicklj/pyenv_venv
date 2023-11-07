# setpyenv.ps1
param (
    [String]$arg
)

# Check if the argument is empty
if ([String]::IsNullOrEmpty($arg)) {
    Write-Warning "
    Please specify an environment to activate.
    Activate/Change env: setpyenv <environment>
    Deactivate: setpyenv deactivate"
    return
}

# Check if the argument is 'deactivate'
if ($arg -eq "deactivate") {
    # Deactivate the current environment
    deactivate
    return
}

# Define the base path where the virtual environments are located
$basePath = $HOME + "/venv"

# Construct the full path by combining the base path and the argument
$scriptToRun = Join-Path -Path $basePath -ChildPath $arg/Scripts/activate.ps1

# Check if the file exists
if (Test-Path $scriptToRun) {
    # Execute the script
    try {
        & $scriptToRun
    } catch {
        Write-Error "An error occurred while executing the script: $_"
    }
} else {
    Write-Error "The script '$scriptToRun' does not exist."
}
