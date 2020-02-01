" vim: set sw=2 ts=2 sts=2 et tw=120 foldmarker={,} foldlevel=10 foldmethod=marker:
"
" $02-keybinds.vim
" Key mapping config

" Mappings .{{{
"---------------------------------------------------------------------------"
" Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator |
"------------------|--------|--------|---------|--------|--------|----------|
" map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |
" nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |
" vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |
" omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |
" xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |
" smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |
" map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |
" imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |
" cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |
"---------------------------------------------------------------------------"

" Set <leader> and <localleader>
let g:mapleader      = ','
let g:maplocalleader ='\'

" Map for conveince edit vimrc file
noremap <leader>ev :edit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" Useful key mappings
nmap <leader>. :bprevious<cr>
nmap <leader>, :bnext<cr>
noremap <leader>/ :noh<cr><cr>
noremap H ^
noremap L g_
" noremap <Down> 5j
" noremap <Up> 5k
" delete line in insert mode
inoremap <c-d> <esc>ddi

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Map for lightline
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

" Tarbar
nnoremap <silent> <F3> :TagbarToggle<CR>

" Useful commands
command! CleanPlugins call map(dein#check_clean(), "delete(v:val, 'rf')")

command! BufOnly silent! execute "%bd|e#|bd#"

command! Cwd execute "lcd %:p:h"
cmap cwd :Cwd
cmap cd. :Cwd

" }}}
