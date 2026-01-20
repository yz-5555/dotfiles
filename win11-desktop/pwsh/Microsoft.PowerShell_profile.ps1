# starship
Invoke-Expression (&starship init powershell)

# modules
. "$PSScriptRoot\functions.ps1"

# yazi
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

# alias
Set-Alias vim nvim

# env_vars
Set-PermanentEnvVar "XDG_CONFIG_HOME" "C:\Users\yz\.config" # nvim, wezterm, winfetch, scoop
Set-PermanentEnvVar "XDG_STATE_HOME" "C:\Users\yz\.local\state" # nvim-data
Set-PermanentEnvVar "XDG_DATA_HOME" "C:\Users\yz\.local\share" # nvim-data
Set-EnvVar "EDITOR" "nvim"
Set-EnvVar "YAZI_CONFIG_HOME" "$HOME\.config\yazi"
Set-EnvVar "YAZI_FILE_ONE" "$HOME\scoop\apps\git\current\usr\bin\file.exe"
Set-EnvVar "DDF_TARGET" "$HOME\Documents\devs\dotfiles"
# notes
# Alacritty DOES NOT support changing the config path.
Append-Path "$HOME\Documents\devs\projects\ddf\target\release"
