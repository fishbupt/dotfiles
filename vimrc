" vim: set sw=2 ts=2 sts=2 et tw=120 foldmarker={,} foldlevel=10 foldmethod=marker:
"
" This is the personal .vimrc file of fishbupt

" Basic. {{{

set nocompatible

let s:is_win = has('win32') || has('win64')
let s:is_linux = has('unix') && !has('macunix') && !has('win32unix')
let s:is_mac = has('macunix')

if !s:is_win
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
set autoindent          " Keep indentation
set tabstop=4           " Set tab equal to 4 spaces
set softtabstop=4       " Set soft tab equal to 4 spaces
set shiftwidth=4        " Set auto indent spacing
set expandtab           " Expand tab into spaces
set smarttab            " Insert spaces in front of lines
set backspace=indent,eol,start " Make backspace work like most other programs
set breakindent
set smartindent
" }}}

" Appearance. {{{
set ambiwidth=single " set to single if you really want to use powerline fonts
set cmdheight=1
set conceallevel=2
set cursorline       " highlight current line
set display=lastline
set laststatus=2     " display statusline
set noshowmode       " don't display mode at statusline
set lines=30       " make vim take fullscreen by setting lines&columns
set columns=120
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
set synmaxcol=512

" }}}

" Symbols define {{{
let s:powerline_font              = 1 " Enable for powerline glyphs
if s:powerline_font
  let s:symbol_separator_left     = "\uE0B0"
  let s:symbol_separator_right    = "\uE0B2"
  let s:symbol_subseparator_left  = "\uE0B1"
  let s:symbol_subseparator_right = "\uE0B3"
  let s:symbol_vcs_branch         = "\uE0A0"
else
  let s:symbol_separator_left     = "▏"
  let s:symbol_separator_right    = "▕"
  let s:symbol_subseparator_left  = "│"
  let s:symbol_subseparator_right = "│"
  let s:symbol_vcs_branch         = "\u16B4"
endif
" }}}

" Terminal UX {{{
set t_Co=256 " Terminal supports 256 colors
set t_md=    " Disable bold fonts in terminal

" Enable italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

if has('termguicolors')
  set termguicolors " Enable 24bit colors in terminal
endif
" }}}

" GUI. {{{
if has('gui_running')
  let g:no_buffers_menu=1
  set guioptions+=M "Don't load menu.vim
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
set virtualedit=block
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

  " general
  call dein#add('chriskempson/base16-vim', {'merged': 0})
  call dein#add('itchyny/lightline.vim')
  call dein#add('decayofmind/vim-lightline-functions', {'merged': 0})
  call dein#add('mengelbrecht/lightline-bufferline')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ryanoasis/vim-devicons')

  call dein#add('Yggdroot/LeaderF', {
            \'build': './install.bat'
            \})
  call dein#add('neoclide/coc.nvim', {
            \'merged': 0,
            \'build': 'yarn install --frozen-lockfile'
            \})
  " lang#c&cpp
  call dein#add('octol/vim-cpp-enhanced-highlight', {
            \'merged': 0,
            \'on_ft': 'cpp'
            \})
  call dein#add('pboettch/vim-cmake-syntax', {
            \'on_ft': 'cmake'
            \})

  "call dein#add('liuchengxu/vim-clap', {'build': 'call clap#helper#build_all()'})

  call dein#end()
  call dein#save_state()
  if s:first_setup
    call dein#install()
  endif

endif

filetype plugin indent on       " Automatically detect file types.
syntax enable                   " Syntax highlighting
" }}}

" lightline & bufferline. {{{ 

let g:lightline                   = {}
let g:lightline.colorscheme       = 'solarized'
let g:lightline.separator         = {'left': s:symbol_separator_left, 'right': s:symbol_separator_right}
let g:lightline.subseparator      = {'left': s:symbol_subseparator_left, 'right': s:symbol_subseparator_right}
let g:lightline.active            = {
      \ 'left': [['mode', 'paste'], ['readonly', 'cwd'], ['filename'], ['gitbranch', 'modified']],
      \ 'right': [['percent', 'lineinfo'], ['whitespace', 'fileformat', 'fileencoding'], ['filetype'], ['cocstatus']],
      \ }
let g:lightline.inactive           = {'left': [['name']], 'right': [['percent', 'lineinfo']]}
let g:lightline.tabline            = {'left': [['buffers']], 'right': [['tabwidth']]}
let g:lightline.mode_map           = {
      \ 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'V', "\<C-v>": 'V',
      \ 'c': 'C', 's': 'S', 'S': 'S', "\<C-s>": 'S', 't': 'T',
      \ }
let g:lightline.component_expand   = {'buffers': 'lightline#bufferline#buffers'} 
let g:lightline.component_type     = {'buffers': 'tabsel'}
let g:lightline.component        = {
      \ 'cwd': '%{fnamemodify(getcwd(), ":~")}',
      \ }
let g:lightline.component_function = {
      \   'gitbranch': 'MyGitbranch',
      \   'tabwidth': 'MyTabWidth',
      \   'cocstatus': 'coc#status',
      \   'fileencoding': 'lightline#functions#fileencoding',
      \   'fileformat': 'lightline#functionsfileformat_devicons',
      \   'filename': 'lightline#functions#filename',
      \   'filetype': 'lightline#functions#filetype_devicons',
      \   'gitinfo': 'lightline#functions#gitinfo_coc',
      \   'gitblame': 'lightline#functions#gitblame_coc',
      \   'lineinfo': 'lightline#functions#lineinfo',
      \   'method': 'lightline#functions#method_vista',
      \   'mode': 'lightline#functions#mode',
      \   'readonly': 'lightline#functions#readonly',   
      \ }

function! MyTabWidth()
  return 'tw=' . &tabstop
endfunction

function! MyGitbranch() abort
  if exists('g:loaded_fugitive')
    try
      let l:head = fugitive#head()
      if empty(l:head)
        call fugitive#detect(getcwd())
        let l:head = fugitive#head()
      endif
      return empty(l:head) ? '' : '  '.l:head 
    catch
    endtry
  endif
  return ''
endfunction

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:lightline#bufferline#show_number = 2
"let g:lightline#bufferline#composed_number_map = {
"\ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
"\ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
"\ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
"\ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '}

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
nmap <A-1> <Plug>lightline#bufferline#go(1)
nmap <A-2> <Plug>lightline#bufferline#go(2)
nmap <A-3> <Plug>lightline#bufferline#go(3)
nmap <A-4> <Plug>lightline#bufferline#go(4)
nmap <A-5> <Plug>lightline#bufferline#go(5)
nmap <A-6> <Plug>lightline#bufferline#go(6)
nmap <A-7> <Plug>lightline#bufferline#go(7)
nmap <A-8> <Plug>lightline#bufferline#go(8)
nmap <A-9> <Plug>lightline#bufferline#go(9)
nmap <A-0> <Plug>lightline#bufferline#go(10)
" .}}}
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

