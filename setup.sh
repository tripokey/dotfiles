#! /usr/bin/env nix-shell
#! nix-shell deps.nix -i bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

sudo tml -f "$PWD"/configuration.nix /etc/nixos/configuration.nix
tml -f "$PWD"/cfg/.gitconfig "$HOME"/.gitconfig
tml -f "$PWD"/cfg/.Xresources "$HOME"/.Xresources
tml -f "$PWD"/cfg/config.nix "$HOME"/.nixpkgs/config.nix
tml -f "$PWD"/cfg/.vimperatorrc "$HOME"/.vimperatorrc
tml -f "$PWD"/cfg/kakrc "$HOME"/.config/kak/kakrc
echo "" > "$HOME"/.zshrc
