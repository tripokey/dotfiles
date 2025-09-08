mkdir ~/.cache/starship
starship init nu | str replace 'size -c' 'size' | save -f ~/.cache/starship/init.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
/home/linuxbrew/.linuxbrew/bin/carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
