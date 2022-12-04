mkdir ~/.cache/starship
starship init nu | str replace --string 'size -c' 'size' | save ~/.cache/starship/init.nu
