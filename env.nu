use std "path add"

path add "~/.local/bin"
path add "~/npm/bin"

mkdir ~/.cache/starship
starship init nu | str replace 'size -c' 'size' | save -f ~/.cache/starship/init.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

mkdir ~/.cache/jujutsu
jj util completion nushell | save --force ~/.cache/jujutsu/init.nu

mkdir ~/.cache/mise
mise activate nu | save --force ~/.cache/mise/init.nu
