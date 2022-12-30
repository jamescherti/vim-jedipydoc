" jedipydoc.vim
" Maintainer: James Cherti
" URL: https://github.com/jamescherti/vim-jedipydoc
" License: MIT

scriptencoding utf-8

function! jedipydoc#show_documentation() abort
    if !exists(':JediDebugInfo')
        echoerr 'Jedipydoc requires the Vim plugin Jedi-vim: ' .
            \ 'https://github.com/davidhalter/jedi-vim'
        return
    endif

    python3 if jedi_vim.show_documentation() is None: vim.command('return')

    let l:way_to_open_documentation = get(
        \ b:, 'jedipydoc_way_to_show_documentation',
        \ g:jedipydoc_way_to_show_documentation)
    if index(['tab', 'split'], l:way_to_open_documentation) < 0
        let l:way_to_open_documentation = 'split'
    endif

    let bn = bufnr('__doc__')
    if l:way_to_open_documentation ==# 'tab'
        if bn > 0
            for l:win_id in win_findbuf(bn)
                if win_gotoid(l:win_id)
                    return
                endif
            endfor
        endif

        tabnew __doc__
    elseif l:way_to_open_documentation ==# 'split'
      if bn > 0
          let wi=index(tabpagebuflist(tabpagenr()), bn)
          if wi >= 0
              " If the __doc__ buffer is open in the current tab, jump to it
              silent execute (wi+1).'wincmd w'
          else
              silent execute 'sbuffer '.bn
          endif
      else
          split __doc__
      endif
    endif

    setlocal modifiable
    setlocal noswapfile
    setlocal buftype=nofile
    silent normal! ggdG
    silent $put=l:doc
    silent normal! 1Gdd
    setlocal nomodifiable
    setlocal nomodified
    setlocal filetype=rst
    setlocal foldlevel=200 " do not fold in __doc__

    if l:way_to_open_documentation ==# 'split'
        let l:doc_height= get(g:, 'jedi#max_doc_height', 30)
        if l:doc_lines > l:doc_height " max lines for plugin
            let l:doc_lines = l:doc_height
        endif
        execute 'resize '.l:doc_lines
    endif

    " quit comands
    nnoremap <buffer> q ZQ
    if len(g:jedipydoc_documentation_command)
      execute 'nnoremap <buffer> ' . g:jedipydoc_documentation_command . ' ZQ'
    endif
endfunction
