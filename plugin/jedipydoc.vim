" jedipydoc.vim
" Maintainer: James Cherti
" URL: https://github.com/jamescherti/vim-jedipydoc
" License: MIT
"
" This part of the software is just the vim interface. The really big deal is
" the Jedi Python library.

let g:jedipydoc_documentation_command =
    \ get(g:, 'jedipydoc_documentation_command', '<Leader>K')
let g:jedipydoc_way_to_show_documentation =
    \ get(g:, 'jedipydoc_way_to_show_documentation', 'tab')
let g:jedipydoc_max_doc_height = get(g:, 'jedipydoc_max_doc_height', 30)

" vim: set et ts=4:
