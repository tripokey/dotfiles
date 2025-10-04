use std "path add"

hide-env PAGER

path add "~/.local/bin"
path add "~/npm/bin"

$env.config.buffer_editor = 'nvim'

alias wezterm = flatpak run org.wezfurlong.wezterm
alias nv = nvim
alias ghce = gh copilot explain
alias ghcs = gh copilot suggest

source $"($nu.home-path)/.cargo/env.nu"
source ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu

# $env.config.hooks.command_not_found = {
#     |cmd_name| (
#       try {
#         for $bin_type in [binary sysbinary] {
#           let pkg = $"(NO_COLOR=1 moss info $"($bin_type)\(($cmd_name))")"
#
#           if $env.LAST_EXIT_CODE == 0 {
#             let pkg = $pkg | lines | get 0 | detect columns --no-headers | get column1.0
#             let r = [y,N] | input list $"Install package '($pkg)'? [y/N]"
#             if $r == 'N' {
#               return 0
#             }
#             echo $" >> sudo moss install '($bin_type)\(($cmd_name))'"
#             sudo moss install $"($pkg)"
#             return
#           }
#         }
#
#         echo $"nu: ($cmd_name): command not found"
#
#         return 127
#       }
#     )
#   }
