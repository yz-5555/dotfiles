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

Dotfile -source "C:\Users\yz-win\.config\wezterm" -target "..\wezterm"
Dotfile -source "C:\Users\yz-win\AppData\Local\nvim" -target "..\nvim"
Dotfile -source "C:\Users\yz-win\AppData\Roaming\helix\config.toml" -target "..\helix\config.toml"
Dotfile -source "C:\Users\yz-win\.config\starship.toml" -target "..\starship\starship.toml"
