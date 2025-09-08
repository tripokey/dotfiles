use std "path add"

path add "~/.local/bin"
path add "/home/linuxbrew/.linuxbrew/bin"
path add "/home/linuxbrew/.linuxbrew/sbin"

$env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
$env.HOMEBREW_CELLAR = "/home/linuxbrew/.linuxbrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/home/linuxbrew/.linuxbrew/Homebrew"

$env.config.buffer_editor = 'nvim'

alias wezterm = flatpak run org.wezfurlong.wezterm
alias nv = nvim

source $"($nu.home-path)/.cargo/env.nu"
source ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu
