# basic
### 1. scoop
```
Set-ExecutionPolicy - ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```
### 2. Firefox
```
scoop install firefox
```
### 3. Win11Debloat
```
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```
### 4. pwsh 7
```
winget install --id Microsoft.PowerShell --source winget
```

### 5. NerdFonts && JetBrains Mono NF
```
scoop bucket add nerd-fonts
scoop install jetbrainsmono-nf-mono
```
# dev
### 1. [Visual Studio Build Tools](https://aka.ms/vs/stable/vs_BuildTools.exe)
- [ ] `C++ Clang tools for Windows`
- [ ] `MSVC Build Tools for x64/x86`
- [ ] `Windows 11 SDK`
> Install `vcredist2022` from scoop or manually, not from VS installer.
### 2. Rust
```
scoop install rustup
```
### 3. ddf
```
cd ~/Documents/dev/projects
git clone https://github.com/yz-5555/ddf.git
cargo build --release

cd ~/Documents/dev/dotfiles
git clone https://github.com/yz-5555/dotfiles.git

$env:DDF_TARGET = "$HOME\Documents\dev\dotfiles"
$env:Path += ";$HOME\Documents\dev\projects\ddf\target\release"

ddf pull win11-desktop
```
### 4. Install tools
```
scoop install neovim alacritty starship yazi
```
> The path to alacritty config is `%APPDATA%/alacritty/alacritty.toml`
>
> Check [yazi dependencies](https://yazi-rs.github.io/docs/installation)
>
> Don't forget to setup wakatime on neovim

### 5. C/C++
```
scoop install llvm cmake clangd ninja
```
### 6. lua
```
scoop install lua-language-server stylua
```
### 7. Zig
```
scoop install zig zls
```
# etc
### - Gaming laptop manager
```
scoop install g-helper // ASUS gaming laptop
scoop install lenovolegiontoolkit // Lenovo Legion laptop
```
### - CLI apps
```
scoop install winfetch bottom
```
### - Real etc
```
scoop install telegram discord obsidian
```
### - Pass
```
scoop install keepassxc
```
> Install a database from Proton Drive.
### - syncthing
```
scoop install syncthing
```
> Use Task Scheduler to automate initialization. `--no-console --no-browser`
### Useful tools
- `crystaldiskinfo`
- `libreoffice`
