function Set-PermanentEnvVar {
    param([string]$Name, [string]$Value)

    $currentValue = [System.Environment]::GetEnvironmentVariable($Name, "User")
    if ($currentValue -ne $Value) {
        Write-Host "Updating Registry for $Name..." -ForegroundColor Cyan
        [System.Environment]::SetEnvironmentVariable($Name, $Value, "User")
    }
    Set-Content -Path "Env:\$Name" -Value $Value
}

Set-PermanentEnvVar "XDG_CONFIG_HOME" "$HOME\.config" # nvim, wezterm, winfetch, scoop
Set-PermanentEnvVar "XDG_STATE_HOME" "$HOME\.local\state" # nvim-data
Set-PermanentEnvVar "XDG_DATA_HOME" "$HOME\.local\share" # nvim-data
