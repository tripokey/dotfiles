# dotfiles

## Installation

```
./setup.sh
sudo nixos-rebuild switch
```

## Example .envrc

```
use nix -I nixpkgs=$HOME/nixpkgs-channels -p rust-env
```
