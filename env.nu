mkdir ~/.cache/starship
starship init nu | str replace --string 'size -c' 'size' | save -f ~/.cache/starship/init.nu
