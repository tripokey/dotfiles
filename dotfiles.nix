{ user, homeDir, dotfiles }:

{
  text = ''
    ln -sfn ${dotfiles}/.gitconfig ${homeDir}/.gitconfig
    ln -sfn ${dotfiles}/.Xresources ${homeDir}/.Xresources
    ln -sfn ${dotfiles}/.tmux.conf ${homeDir}/.tmux.conf
    ln -sfn ${dotfiles}/.xmonad ${homeDir}/.xmonad

    mkdir -p ${homeDir}/.stack
    chown ${user} ${homeDir}/.stack
    ln -sfn ${dotfiles}/stack.yaml ${homeDir}/.stack/config.yaml
  '';

  deps = [];
}
