# cd
function cddot ($path) {
	cd "C:\Users\yz\Documents\devs\dotfiles\$path"
}
function cddf ($path) {
	cd "C:\Users\yz\Documents\devs\dotfiles\df\$path"
}
function cdpwsh ($path) {
	cd "C:\Users\yz\Documents\PowerShell\$path"
}
function cdproj ($path) {
	cd "C:\Users\yz\Documents\devs\projects\$path"
}
function cdconf ($path) {
	cd "C:\Users\yz\.config\$path"
}
# utils
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
function gitopen {
    start (git config --get remote.origin.url)
}
function fedora {
	wsl ~
}
function global:reload {
	. $PROFILE
}
function Set-EnvVar {
    param([string]$Name, [string]$Value)
    
    if (-not (Get-ChildItem "Env:\$Name" -ErrorAction SilentlyContinue)) {
        Set-Content -Path "Env:\$Name" -Value $Value
    }
}
function Set-PermanentEnvVar {
    param([string]$Name, [string]$Value)
    
    $currentValue = [System.Environment]::GetEnvironmentVariable($Name, "User")
    
    if ($currentValue -ne $Value) {
        Write-Host "Updating Registry for $Name..." -ForegroundColor Cyan
        [System.Environment]::SetEnvironmentVariable($Name, $Value, "User")
    }
    
    Set-Content -Path "Env:\$Name" -Value $Value
}
function Append-Path ($newPath) {
	if ($env:Path -notlike "*$newPath") {
		$env:Path += ";$newPath"
	}
}

# Yes, some codes are AI generated. I mean, who the fuck wants to write codes in this ugly ass fuckass language?
