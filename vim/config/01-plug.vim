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
Pack 'chriskempson/base16-vim'
Pack 'tpope/vim-fugitive'
Pack 'ryanoasis/vim-devicons'
Pack 'Yggdroot/indentLine'
Pack 'bronson/vim-trailing-whitespace'
Pack 'dstein64/vim-startuptime'
Pack 'neoclide/coc.nvim', {'do': {-> system('yarn install --frozen-lockfile')}}

Pack 'majutsushi/tagbar', {'on': 'TagbarToggle'}

" language
Pack 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Pack 'pboettch/vim-cmake-syntax', {'for': 'cmake'}
Pack 'PProvost/vim-ps1', {'for': 'ps'}
Pack 'tpope/vim-scriptease', {'for': 'vim'}
Pack 'neoclide/coc-neco', {'for': 'vim'}


call plugpac#end()

filetype plugin indent on       " Automatically detect file types.
syntax enable                   " Syntax highlighting
" }}}

colorscheme base16-solarized-dark

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

nmap <leader><space> :FixWhitespace<cr>
let g:extra_whitespace_ignored_filetypes = ['defx', 'markdown', 'mkd']

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
"
