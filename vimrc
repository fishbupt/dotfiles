" vim: set sw=2 ts=2 sts=2 et tw=120 foldmarker={,} foldlevel=10 foldmethod=marker:
"
" This is the personal .vimrc file of fishbupt

" Basic. {{{
function! OXS()
  return has('macunix')
endfunction

function! LINUX()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction

function! WINDOWS()
  return (has('win32') || has('win64'))
endfunction

set nocompatible
if !WINDOWS()
  set shell=/bin/sh
else
  set shell=cmd.exe
endif

" }}}

" Encoding .{{{
if has('vim_starting')    
  " Changing encoding in Vim at runtime is undefined behavior
  setglobal fileencoding=utf-8
  set encoding=utf-8
  set fileencodings=usc-bom,utf-8,gbk,utf-16le,cp1252,iso-8859,cp936
  set fileformats=unix,mac,dos
endif

" This command has to be called after `set encoding`
scriptencoding utf-8

" }}}

" Indent. {{{
set autoindent
set backspace=indent,eol,start " make backspace work like most other programs
set breakindent
set expandtab
set shiftwidth=4
set smartindent
set tabstop=4
" }}}

" Appearance. {{{
set ambiwidth=single " set to single if you really want to use powerline fonts
set cmdheight=1
set conceallevel=2
" set cursorline
set display=lastline
set laststatus=2
"set list
"set listchars=tab:>\ ,trail:\ ,extends:<,precedes:<
set noarabicshape
set nowrap
set number
" set relativenumber
set scrolloff=3
set showcmd
set showmatch
set signcolumn=no
"set statusline=%<%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}%=%l/%L,%c%V%8P
set synmaxcol=512
" }}}

" GUI. {{{
if has('gui_running')
  let g:no_buffers_menu=1
  set guioptions-=m "Hide menu bar.
  set guioptions-=T "Hide toolbar.
  set guioptions-=L "Hide left-hand scrollbar
  set guioptions-=r "Hide right-hand scrollbar
  set guioptions-=b "Hide bottom scrollbar
  set guioptions-=e "Hide tab
  set showtabline=2 "Show tabline, enable airline#tabline extentsion
  set mousehide     "Hide the mouse cursor while typing
  set visualbell
  set t_vb=
  " DON'T put quotes to font name
  set guifont=SauceCodePro_Nerd_Font_Mono:h11:cANSI:qDRAFT
endif
" }}}

" Folding. {{{
set foldenable
"set foldcolumn=1
"set foldmethod=indent
"set foldtext=Mopp_fold_text()
set foldmarker=\ {{{,\ }}}
" }}}

" Safety. {{{
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set swapfile
set writebackup
" }}}

" History {{{
set history=2048
set undodir=~/.vim/undo
set undofile
set viewoptions=cursor,folds
" }}}

" Search. {{{
set hlsearch
set ignorecase
set incsearch
set smartcase
" }}}

" Others. {{{
set mouse=a                     " Automatically enable mouse usage.
set belloff=all
set completeopt=menu
set dictionary=/usr/share/dict/words
set diffopt+=iwhite
set formatoptions+=tjrol
set helplang=ja
set langnoremap
set lazyredraw
set matchpairs+=<:>
set regexpengine=2
set splitright
set updatetime=500
set virtualedit=all
set whichwrap=b,s,h,l,<,>,[,]
set wildignorecase
set wildmenu

" Turn off default plugins. {{{
if has('nvim')
  let g:plugin_bundle_dir = '~/.vim/bundle/'
else
  let g:plugin_bundle_dir = '~/.vim/vimBundle/'
endif
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_matchparen = 1
" }}}

" Configs for default scripts. {{{
let g:airline_use_powerline_fonts = 1
let g:lisp_rainbow = 1
let g:lisp_instring = 1
let g:lispsyntax_clisp = 1
let g:c_syntax_for_h = 1
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
" }}}
" }}}

" Helper Func. {{{
function! s:check_cmd(cmd) abort
  if executable(a:cmd)
    return 1
  else
    echom 'Need command: ' . a:cmd
endfunction
" }}}

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

" Map for clap
nnoremap <c-f> :Clap files<cr>
nnoremap <c-b> :Clap buffers<cr>
nnoremap <c-g> :Clap grep<cr>
nnoremap <c-l> :Clap lines<cr>

" Useful commands
command! CleanPlugins call map(dein#check_clean(), "delete(v:val, 'rf')")

command! BufOnly silent! execute "%bd|e#|bd#"

command! Cwd execute "lcd %:p:h"
cmap cwd :Cwd
cmap cd. :Cwd

" }}}

" Plugins. {{{
" dein.vim {{{
let s:dein_base_path = expand(g:plugin_bundle_dir)
let s:dein_path = s:dein_base_path . 'repos/github.com/Shougo/dein.vim'
let s:has_dein = isdirectory(s:dein_path)
"auto install dein
let s:first_setup = 0
if !s:has_dein
  if s:check_cmd('git')
    call system(join([
        \ 'git',
        \ 'clone',
        \ 'https://github.com/Shougo/dein.vim',
        \ s:dein_path
        \ ], ' '))
    let s:has_dein = 1
    let s:first_setup = 1
  endif
endif
" Add the dein intallation directory into runtimepath
let &runtimepath .= ',' . s:dein_path
let g:dein#install_log_filename = '~/.vim/dein.log'

if s:has_dein && dein#load_state(s:dein_base_path)
  call dein#begin(s:dein_base_path)

  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('wsdjeg/dein-ui.vim')

  call dein#add('chriskempson/base16-vim', {'merged': 0})
  call dein#add('liuchengxu/eleline.vim')
  call dein#add('bagrat/vim-buffet', {'merged': 0})
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tpope/vim-fugitive')

  call dein#add('Yggdroot/LeaderF', {
            \'build': './install.bat'
            \})
  call dein#add('neoclide/coc.nvim', {
            \'merged': 0,
            \'build': 'yarn install --frozen-lockfile'
            \})
  " lang#c&cpp
  call dein#add('octol/vim-cpp-enhanced-highlight', {'merged': 0})

  "call dein#add('liuchengxu/vim-clap', {'build': 'call clap#helper#build_all()'})

  call dein#end()
  call dein#save_state()
  if s:first_setup
    call dein#install()
  endif

  let g:buffet_powerline_separators = 1
  let g:buffet_tab_icon = "\uf00a"
  let g:buffet_left_trunc_icon = "\uf0a8"
  let g:buffet_right_trunc_icon = "\uf0a9" 
  let g:eleline_powerline_fonts=1
endif
filetype plugin indent on       " Automatically detect file types.
syntax enable                   " Syntax highlighting
" }}}

colorscheme base16-solarized-dark

" Leaderf. {{{
" leader config
let g:Lf_RgConfig = [
      \ "--max-columns=150",
      \ "--glob=!git/*",
      \ "--hidden"
      \ ]
" let g:Lf_ShortcutF = '<leader>ff'
" let g:Lf_ShortcutB = '<leader>bb'
noremap <C-F> :<C-U><C-R>=printf("Leaderf --popup file %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf --popup buffer %s", "")<CR><CR>
noremap <C-G> :<C-U><C-R>=printf("Leaderf --popup rg -F %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>fb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" }}}

" coc. {{{
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Highlight jsonc comment
autocmd FileType json syntax match comment +\/\/.\+$+
" }}}

" {{{ cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error = 1
" }}}
" }}}

