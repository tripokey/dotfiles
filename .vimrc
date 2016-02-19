" Auto install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'altercation/vim-colors-solarized'
if filereadable(expand("$HOME/.vimrc-pkgs"))
  source $HOME/.vimrc-pkgs
endif
call plug#end()

" Key bindings
set pastetoggle=<F2>

" User settings
set expandtab
set shiftwidth=2
set tabstop=2
set relativenumber

" Eye candy
colorscheme solarized
set background=dark
set term=screen-256color

if filereadable(expand("$HOME/.vimrc-adaptation"))
  source $HOME/.vimrc-adaptation
endif
