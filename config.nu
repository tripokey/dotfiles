source ~/.cache/starship/init.nu

# alias wezterm = flatpak run org.wezfurlong.wezterm

$env.PATH = ($env.PATH | split row (char esep) | prepend ( $nu.home-path | path join ".cargo/bin") | prepend ( $nu.home-path | path join ".local/bin"))
