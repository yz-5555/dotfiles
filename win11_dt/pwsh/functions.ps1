# cd
function cddot ($path) {
	Set-Location "$HOME\Documents\dev\dotfiles\$path"
}
function cdnotes ($path) {
	Set-Location "$HOME\Documents\notes\$path"
}
function cdpwsh ($path) {
	Set-Location "$HOME\Documents\PowerShell\$path"
}
function cdproj ($path) {
	Set-Location "$HOME\Documents\dev\projects\$path"
}
function cdconf ($path) {
	Set-Location "$env:XDG_CONFIG_HOME\$path"
}
# utils
function exif_sep {
	New-Item -ItemType Directory -Name "originals"
	Get-ChildItem -Filter *.jpg_original | Move-Item -Destination .\originals\
	Get-ChildItem -Filter *.mp4_original | Move-Item -Destination .\originals\
}
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
function fedora {
    wsl ~
}
function global:reload {
    . $PROFILE
}
