augroup my_neomake_cmds
  autocmd!
  autocmd BufWritePost *.rs Neomake! cargo
augroup END

let g:neomake_verbose=3
