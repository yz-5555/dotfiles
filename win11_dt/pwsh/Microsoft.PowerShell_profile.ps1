# starship `starship init powershell < $PATH/.starship_init.ps1`
. "$HOME\.config\.starship_init.ps1"

# modules
. "$PSScriptRoot\functions.ps1"


# alias
Set-Alias vim nvim
Set-Alias obs ~/scoop/apps/obsidian/current/Obsidian.com

# env_vars
$env:EDITOR = "nvim"
$env:YAZI_CONFIG_HOME = "$env:XDG_CONFIG_HOME\yazi"
$env:YAZI_FILE_ONE = "$HOME\scoop\apps\git\current\usr\bin\file.exe"
$env:DDF_TARGET = "$HOME\Documents\dev\dotfiles"
$env:Path += ";$HOME\Documents\dev\projects\ddf\target\release"

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
