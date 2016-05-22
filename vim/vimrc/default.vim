if &shell =~# 'fish$'
  set shell=/run/current-system/sw/bin/zsh
endif

" Key bindings
set pastetoggle=<F2>
nnoremap <C-p> :FZF <cr>

" User settings
set expandtab
set shiftwidth=2
set tabstop=2
set relativenumber

" Eye candy
colorscheme solarized
set background=dark
" set term=screen-256color

" Haskell

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.', '{-# ', 're!{-# \w+ ', 'import ', 're!import .+\(.*,?']}

augroup NeomakeHaskell
  autocmd!
  autocmd! BufWritePost *.hs Neomake
augroup END
