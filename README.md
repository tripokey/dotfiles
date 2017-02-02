# dotfiles

## Installation

```
./setup.fish
sudo nixos-rebuild switch
```

## Example .envrc

```
use nix -I nixpkgs=$HOME/nixpkgs-channels -p rust-env
```
