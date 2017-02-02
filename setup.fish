#! /usr/bin/env nix-shell
#! nix-shell -i fish -p fish

cd (dirname (status --current-filename))

function create_dir
  if not test -d $argv
    echo "Creating "$argv
    mkdir -p $argv
    if test $status -ne 0
      echo "Failed to create " $argv
      exit 2
    end
  end
end

function setup
  if not test -e $argv[1]
    echo "error: "$argv[1]" is missing"
    exit 1
  end

  create_dir (dirname $argv[2])

  echo "Setting up "$argv[2]" -> "$argv[1]
  ln -sf $argv[1] $argv[2]
  if test $status -ne 0
    echo "Failed to setup "$argv[2]" -> "$argv[1]
    exit 3
  end
end

function sudo_create_dir
  if not test -d $argv
    echo "Creating "$argv
    sudo mkdir -p $argv
    if test $status -ne 0
      echo "Failed to create " $argv
      exit 2
    end
  end
end

function sudo_setup
  if not test -e $argv[1]
    echo "error: "$argv[1]" is missing"
    exit 1
  end

  sudo_create_dir (dirname $argv[2])

  echo "Setting up "$argv[2]" -> "$argv[1]
  sudo ln -sf $argv[1] $argv[2]
  if test $status -ne 0
    echo "Failed to setup "$argv[2]" -> "$argv[1]
    exit 3
  end
end

sudo_setup (pwd)/configuration.nix /etc/nixos/configuration.nix
setup (pwd)/cfg/config.fish $HOME/.config/fish/config.fish
setup (pwd)/cfg/.gitconfig $HOME/.gitconfig
setup (pwd)/cfg/.Xresources $HOME/.Xresources
setup (pwd)/cfg/.tmux.conf $HOME/.tmux.conf
setup (pwd)/cfg/xmonad.hs $HOME/.xmonad/xmonad.hs
setup (pwd)/cfg/config.nix $HOME/.nixpkgs/config.nix
setup (pwd)/cfg/.vimperatorrc $HOME/.vimperatorrc
