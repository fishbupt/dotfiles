" Here are some basic customizations, please refer to the ~/.SpaceVim.d/init.vim
" file for all possible options:
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
let g:spacevim_default_indent = 2
let g:spacevim_max_column     = 120

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles.
" let g:spacevim_plugin_bundle_dir = '~/.cache/vimfiles'

" set SpaceVim colorscheme
let g:spacevim_colorscheme = 'base16-gruvbox-dark-soft'

let g:spacevim_enable_ycm = 1
let g:ycm_always_populate_location_list = 1

" Set plugin manager, you want to use, default is dein.vim
" let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" use space as `<Leader>`
let g:mapleader = ","

" Set windows shortcut leader [Window], default is `s`
let g:spacevim_windows_leader = 's'

" The default file manager of SpaceVim.
let g:spacevim_filemanager             = 'nerdtree'
" Enable/Disable vimfiler in the welcome windows. Default is 1. 
" This will cause vim to start up slowly if there are too many files in the
" current directory. 
let g:spacevim_enable_vimfiler_welcome = 0

" Set unite work flow shortcut leader [Unite], default is `f`
let g:spacevim_unite_leader = 'f'

let g:spacevim_buffer_index_type = 4

let g:spacevim_enable_neomake = 0
let g:spacevim_warning_symbol = '➤'

if g:spacevim_enable_neomake
  " When writing a buffer.
  " call  neomake#configure#automake('w')
  " " When writing a buffer, and on normal mode changes (after 750ms)
  " call neomake#configure#automake('nw', 750)
  " " when reading a buffer (after 1s), and when writing
  " call neomake#configure#automake('rw', 1000)

  let g:neomake_open_list = 1
  let g:neomake_cpp_enabled_makers = ['clangtidy']
  let g:neomake_cpp_clangtidy_args = ['-p', getcwd(), '-extra-arg=-std=c++14']
endif

let g:spacevim_enable_ale = 1
if g:spacevim_enable_ale
  let g:ale_linter = {
        \'cpp': ['clangtidy'],
        \}
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  " Map key on navigate error and warning
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  " show windows for errors or warnings
  let g:ale_open_list = 0

  let g:ale_cpp_clangtidy_checks=['-*', 'modernize-*', 'cppcoreguidelines-*']
endif
" By default, language specific plugins are not loaded. This can be changed
" with the following, then the plugins for go development will be loaded.
" call SpaceVim#layers#load('lang#go')

" loaded ui layer
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('shell')   

let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
" let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''


let g:incsearch#auto_nohlsearch = 0
" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
"  let g:spacevim_disabled_plugins=[
"     \ ['indentLine'],
"     \ ['floobits-neovim'],
"     \ ]

" If you want to add some custom plugins, use these options:
let g:spacevim_custom_plugins = [
   \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
   \ ['junegunn/fzf.vim'],
   \ ['junegunn/vim-peekaboo'],
   \ ['roxma/vim-tmux-clipboard'],
   \ ['nickhutchinson/vim-cmake-syntax'],
   \ ['tomtom/tcomment_vim'],
   \ ['bronson/vim-visual-star-search'],
   \ ['octol/vim-cpp-enhanced-highlight'],
   \ ]

" cpp hightlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:spacevim_windows_index_type = 1
" mapping airline
nmap <leader>. :bprevious<cr>
nmap <leader>, :bnext<cr>
noremap <leader> / nohighlight<CR>

" FZF and ACK ---------------------------------------------------------------{{{
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" File preview using Hightlight
let g:fzf_files_options =
      \'--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'

" [[B]Commits] Customize the options used by 'git log'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr---%cn"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Key mapping
map <C-f> :Files<cr>
map <C-b> :Buffers<cr>

nmap <C-c> :Commits<cr>
" nmap <C-h> <C-w><C-h>
" nmap <C-j> <C-w><C-j>
" nmap <C-k> <C-w><C-k>
" nmap <C-l> <C-w><C-l>
nmap <leader>cf <plug>(fzf-maps-n)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" key map for CompleteParameter
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"
" Ack key maps
nnoremap <F12> :Ack<CR>

" useful keymaps
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" format code
noremap <M-f> :Neoformat<CR>

" comment
vnoremap <c-/> :TComment<CR>

" define dummy command for IndentLinesDisable
function! s:IndentLinesDisable()
endfunction
command! IndentLinesDisable call <SID>IndentLinesDisable()
"}}}


let g:deoplete#enable_at_startup=1
" set the guifont
" let g:spacevim_guifont = 'DejaVu\ Sans\ Mono\ for\ Powerline\ 11'
