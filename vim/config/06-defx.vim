"=============================================================================
" defx.vim --- defx configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

nnoremap <silent> - :call <SID>defx_open()<CR>
nnoremap <silent><Leader>hh :call <sid>defx_open({ 'find_current_file': v:true })<CR>

if !exists('g:rootmarkers')
  let g:rootmarkers = ['.git', 'build']
endif

" s:get_project_root(): get the project root (if any)
function! s:get_project_root() abort
  let l:path = expand('%:p:h')
  if exists('b:projectroot')
    if stridx(l:path, fnamemodify(b:projectroot, ':p'))==0
      return b:projectroot
    endif
  endif
  if l:path =~ '^fugitive:/'
    if exists('b:git_dir')
      return fnamemodify(b:git_dir, ':h')
    endif
    return '' " skip any fugitive buffers early
  endif
  for marker in g:rootmarkers
    let pivot=l:path
    while 1
      let prev=pivot
      let pivot=fnamemodify(pivot, ':h')
      let fn = pivot.(pivot == '/' ? '' : '/').marker
      if filereadable(fn) || isdirectory(fn)
        return pivot
      endif
      if pivot==prev
        break
      endif
    endwhile
  endfor
  return ''
endfunction

function! s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:is_file = has_key(l:opts, 'dir') && !isdirectory(l:opts.dir)

  if  &filetype ==? 'defx' || l:is_file
    return
  endif

  let l:path = s:get_project_root()

  if has_key(l:opts, 'dir') && isdirectory(l:opts.dir)
    let l:path = l:opts.dir
  endif


  if has_key(l:opts, 'find_current_file')
    call execute(printf('Defx -search=%s %s', expand('%:p'), l:path))
  else
    call execute(printf('Defx %s', l:path))
    " switch to orignal window
    " call execute('wincmd p')
  endif

  return execute("norm!\<C-w>=")
endfunction
function! s:my_defx_custom()
  call defx#custom#option('_', {
        \ 'winwidth': 30,
	      \ 'columns': 'git:icons:indent:filename',
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
  " Setup
  autocmd VimEnter * call s:my_defx_custom()
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
  nnoremap <silent><buffer><expr> s
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O
        \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> n
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')

  " Use > increase defx window size
	nnoremap <silent><buffer><expr> >
        \ defx#do_action('resize', defx#get_context().winwidth + 10)
  " Use < decrease def window size
	nnoremap <silent><buffer><expr> <
        \ defx#do_action('resize', defx#get_context().winwidth - 10)
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
let g:defx_icons_enable_syntax_highlight = 0
