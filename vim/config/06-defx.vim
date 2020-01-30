"=============================================================================
" defx.vim --- defx configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

nnoremap <silent> - :Defx<CR>

" Have issue to call defx function directly
" So call defx custom function after vim startup
augroup defx_fixed
  autocmd VimEnter * call s:my_defx_custom()
augroup END

function! s:my_defx_custom()
  call defx#custom#option('_', {
        \ 'winwidth': 30,
        \ 'split': 'vertical',
        \ 'direction': 'leftabove',
        \ 'show_ignored_files': 0,
        \ 'buffer_name': '',
        \ 'toggle': 1,
        \ 'resume': 1
        \ })

  call defx#custom#column('mark', {
        \ 'readonly_icon': '',
        \ 'selected_icon': '',
        \ })

  call defx#custom#column('icon', {
        \ 'directory_icon': '',
        \ 'opened_icon': '',
        \ 'root_icon': ' ',
        \ })

  call defx#custom#column('filename', {
        \ 'max_width': -90,
        \ })
endfunction
augroup defx_init
  autocmd!
  " Avoid the white space highting issue
  autocmd FileType defx match ExtraWhitespace /^^/
  " Keymap in defx
  autocmd FileType defx call s:defx_my_settings()

augroup END

function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl nonumber
  setl norelativenumber
  setl listchars=
  setl nofoldenable
  setl foldmethod=manual
  setl signcolumn=no
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" Defx git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1
