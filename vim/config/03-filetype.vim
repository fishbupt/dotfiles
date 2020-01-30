"=============================================================================
" filetype.vim --- filetype configuration
" Author: fishbupt <fishbupt@gmail.com>
"============================================================================

augroup Filetype_vim
  autocmd!
  autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab ai
augroup END


augroup Filetype_python
  autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
  " set colorcolumn
  function! ColorColumn()
    if(&colorcolumn == 80)
      set colorcolumn=0
    else
      set colorcolumn=80
    endif
  endfunc
  autocmd FileType python nnoremap <leader>b :call ColorColumn()<cr>
augroup END

augroup Filetype_js
  autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab ai
  autocmd FileType typescript set tabstop=2 shiftwidth=2 expandtab ai
augroup END

augroup Filetype_text
  autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
  autocmd FileType yaml set sw=2 sts=2 et
  " Highlight jsonc comment
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd FileType puppet set sw=2 sts=2 et
augroup END
