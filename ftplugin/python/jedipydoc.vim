" jedipydoc.vim
" Maintainer: James Cherti
" URL: https://github.com/jamescherti/vim-jedipydoc
" License: MIT

if &compatible || v:version < 700
  finish
endif

if len(g:jedipydoc_documentation_command)
    execute 'nnoremap <silent> <buffer> ' .
        \ g:jedipydoc_documentation_command .
        \ ' :call jedipydoc#show_documentation()<CR>'
endif
