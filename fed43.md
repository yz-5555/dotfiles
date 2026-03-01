# basic
### 1. JetBrains Mono NF
- [ ] Install [JetBrains Mono NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)
- [ ] Copy .ttf files to ~/.local/share/fonts
- [ ] `fc-cache -f -v`
### 2. Tweaks, Settings, and Extensions
- [ ] Install `Tweaks`, `Extension Manager` from Software
- [ ] Tweaks > Windows > Titlebar Buttons > Maximize, Minimize
- [ ] Tweaks > Windows > Titlebar Actions > Middle-click
- [ ] Tweaks > Fonts > Monospace Text
- [ ] Settings > Multitasking > General > Hot Corner
- [ ] Settings > Multitasking > App Switching > Include apps from the current workspace only
- [ ] Settings > Date & Time
- [ ] Extensions > Vitals, Weather O'Clock, Launch New Instance, Places Status Indicator
- [ ] Vitals > GPU, CPU, RAM, Network(Device rx)
- [ ] Weather > Celsius
### 3. System upgrade
```
sudo dnf upgrade --refresh
```
# dev
### 1. Terra and RPMFusion
```
dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
### 2. Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
### 3. ddf
```
cd ~/Documents/dev/projects
git clone https://github.com/yz-5555/ddf.git
cd ddf
cargo build --release

cd ~/Documents/dev
git clone https://github.com/yz-5555/dotfiles.git

export DDF_TARGET="/home/yz/Documents/dev/dotfiles"
export PATH="$PATH:/home/yz/Documents/dev/projects/ddf/target/release"

ddf pull fed43-desktop
```
### 4. Install tools
- [ ] Install Alacritty from Software
```
sudo dnf install ffmpeg 7z jq poppler fd ripgrep fzf zoxide ImageMagick xclip
cargo install resvg
sudo dnf install neovim starship yazi fastfetch bottom
```
### 5. C/C++
```
sudo dnf install clang clangd lldb cmake ninja
```
### 6. lua
```
sudo dnf install lua-language-server stylua
```
### 7. Zig
```
sudo dnf install zig

cd ~/apps
git clone https://github.com/zigtools/zls
cd zls
git checkout $version
zig build -Doptimize=ReleaseSafe
```
# etc
### - Real etc
- [ ] Install Telegram, Equibop, Obsidian from Software

