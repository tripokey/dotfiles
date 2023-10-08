mkdir ~/.cache/starship
starship init nu | str replace 'size -c' 'size' | save -f ~/.cache/starship/init.nu
