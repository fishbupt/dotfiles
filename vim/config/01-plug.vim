" vim: set sw=2 ts=2 sts=2 et tw=120 foldmarker={,} foldlevel=10 foldmethod=marker:
"
" $01-plug.vim
" Plug specific config
" This config should be loaded firstly before any other config

" Helper Func. {{{
function! s:check_cmd(cmd) abort
  if executable(a:cmd)
    return 1
  else
    echom 'Need command: ' . a:cmd
  endif
endfunction
" }}}

" minpac {{{
let s:bundle_base_path = expand(g:plugin_bundle_dir)
let s:minpac_path = s:bundle_base_path . 'pack/minpac/opt/minpac'
let s:plugpac_path = s:bundle_base_path . 'autoload/plugpac.vim'
let s:has_minpac = isdirectory(s:minpac_path)
let s:has_plugpac = filereadable(s:plugpac_path)
if !s:has_minpac
  if s:check_cmd('git')
    call system(join([
          \ 'git',
          \ 'clone',
          \ 'https://github.com/k-takata/minpac.git',
          \ s:minpac_path
          \ ], ' '))
  endif
endif
if !s:has_plugpac
  if s:check_cmd('curl')
    call system(join([
          \ 'curl',
          \ '-fLo',
          \ s:plugpac_path,
          \ '--create-dirs',
          \ 'https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim'
          \ ], ' '))
  endif
endif
call plugpac#begin()

" minpac
Pack 'k-takata/minpac', {'type': 'opt'}

" general
Pack 'morhetz/gruvbox'
Pack 'tpope/vim-fugitive'
Pack 'ryanoasis/vim-devicons'
Pack 'Yggdroot/indentLine'
Pack 'ntpeters/vim-better-whitespace'
Pack 'dstein64/vim-startuptime'
Pack 'jiangmiao/auto-pairs'
Pack 'tpope/vim-surround'
Pack 'tpope/vim-repeat'
Pack 'tpope/vim-commentary'
Pack 'svermeulen/vim-yoink'
Pack 'neoclide/coc.nvim', {'do': {-> system('yarn install --frozen-lockfile')}}
Pack 'SirVer/ultisnips'
Pack 'honza/vim-snippets'

Pack 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Pack 'sbdchd/neoformat'
Pack 'luochen1990/rainbow'
Pack 'Konfekt/FastFold'
let g:rainbow_active = 1

" language
" Pack 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Pack 'bfrg/vim-cpp-modern', {'for': 'cpp'}
Pack 'pboettch/vim-cmake-syntax', {'for': 'cmake'}
Pack 'PProvost/vim-ps1', {'for': 'ps'}
Pack 'tpope/vim-scriptease', {'for': 'vim'}
Pack 'vim-python/python-syntax'
let g:python_highlight_all = 1
Pack 'tmhedberg/SimpylFold', {'for': 'python'}
let g:SimplylFold_docstring_preview = 1
Pack 'vim-scripts/indentpython.vim', {'for': 'python'}

" Need to put those two plugins to start folder
Pack 'neoclide/coc-neco'
Pack 'Shougo/neco-vim'


call plugpac#end()

filetype plugin indent on       " Automatically detect file types.
syntax enable                   " Syntax highlighting
" }}}

colorscheme gruvbox

" Tarbar setup
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▶', '▼']
augroup tagbar_init
  autocmd!
  " Keymap in defx
  autocmd FileType tagbar call s:my_tarbar_settings()
augroup END
function! s:my_tarbar_settings() abort
  " Use > increase defx window size
  nnoremap <silent><buffer> > :vertical resize -10<cr>
  " Use < decrease def window size
  nnoremap <silent><buffer> < :vertical resize +10<cr>
endfunction

nmap <leader><space> :StripWhitespace<cr>
let g:current_line_whitespace_disabled_soft = 1
let g:better_whitespace_filetypes_blacklist = ['defx', 'markdown', 'mkd', 'diff', 'gitcommit', 'unite', 'qf', 'help']

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" {{{ cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error = 1
" }}}

" {{{ neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_c_clang_format = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style=file'],
      \ }
let g:neoformat_enabled_python = ['yapf', 'autopep8']
augroup fmt
  autocmd!
  " autocmd FileType python autocmd BufWritePre <buffer> undojoin | Neoformat
  autocmd FileType javascript autocmd BufWritePre <buffer> undojoin | Neoformat
  " autocmd BufWritePre * undojoin | Neoformat
augroup END
noremap <M-f> :Neoformat<CR>
" }}}

" {{{ yoink.
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
" }}}

" {{{ FastFold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
" }}}

" {{{ Ultisnips
let g:UltiSnipsEditSplit = 'vertical'
" }}}

