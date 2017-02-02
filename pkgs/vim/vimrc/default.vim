if &shell =~# 'fish$'
  set shell=/run/current-system/sw/bin/zsh
endif

" Key bindings
set pastetoggle=<F2>
nnoremap <C-p> :FZF <cr>
nnoremap <Leader>] :YcmCompleter GoTo<CR>

" User settings
set expandtab
set shiftwidth=2
set tabstop=2
set relativenumber

" Eye candy
colorscheme solarized
set background=dark
