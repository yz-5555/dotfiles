function Dotfile ($source, $target) {
	# Remove old target
	if (Test-Path -Path $target) {
		Remove-Item -Path $target -Recurse -Force
		Write-Host "Removed $target"
	}
	# Copy & Paste
	if (Test-Path -Path $source) {
		Copy-Item -Path $source -Destination $target -Recurse -Force
		Write-Host "Copied $source to $target"
	}
}

Dotfile -source "..\wezterm\.wezterm.lua" -target "C:\Users\yz-win\.wezterm.lua"
Dotfile -source "..\vim" -target "C:\Users\yz-win\AppData\Local\nvim"
Dotfile -source "..\helix\config.toml" -target "C:\Users\yz-win\AppData\Roaming\helix\config.toml"
Dotfile -source "..\starship\starship.toml" -target "C:\Users\yz-win\.config\starship.toml"
