"=============================================================================
" lightline.vim --- lightline configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

Pack 'itchyny/lightline.vim'
Pack 'itchyny/vim-gitbranch'
Pack 'mengelbrecht/lightline-bufferline'
Pack 'maximbaz/lightline-ale'

" lightline#functions. {{{
function! s:is_terminal() abort
  return &buftype ==# 'terminal'
endfunction

let g:lightline#ale#indicator_checking = ''
let g:lightline#ale#indicator_infos = ''
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_ok = ''

" Copy from lightline-sensible
let s:percentChars = get(g:, 'lightline#sensible#percent_chars', [
  \   "\u25CF       ",
  \   "\u25CF\u25CF      ",
  \   "\u25CF\u25CF\u25CF     ",
  \   "\u25CF\u25CF\u25CF\u25CF    ",
  \   "\u25CF\u25CF\u25CF\u25CF\u25CF   ",
  \   "\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF  ",
  \   "\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF ",
  \   "\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF\u25CF"
  \ ])

" https://github.com/josa42/vim-lightline-sensible/blob/master/autoload/lightline/sensible.vim
function! s:is_hidden()
  let buftypes = ['terminal']
  let filetypes = ['defx', 'tagbar', 'startify', 'list', 'help', 'fugitive', 'fugitiveblame', 'qf', 'git', 'vim-plug']
  return  s:is_terminal() || index(filetypes, &filetype) != -1 
endfunction

function! LightlineCwd() abort
  return s:is_hidden() ? '' : fnamemodify(getcwd(), ":~")
endfunction

function! LightlinePercent() abort
  if s:is_hidden()
    return ''
  endif
  let l = 100 * line('.') / line('$')
  let n = len(s:percentChars)
  let s = 100 / n

  let p = s:percentChars[0]

  let i = n - 1
  while i > 0
    if l > (s * i)
      let p = s:percentChars[i]
      break
    endif

    let i -= 1
  endwhile

  return p . ' ' . l . '%'
endfunction

function! LightlineTabWidth() abort
  return 'tw=' . &tabstop
endfunction

function! LightlineGitbranch() abort
  if s:is_hidden()
    return ''
  endif
  let l:head = gitbranch#name()
  return empty(l:head) ? '' : '  '.l:head
endfunction

" https://github.com/josa42/vim-lightline-sensible/blob/master/autoload/lightline/sensible.vim
function! LightlineFileencoding()
  return s:is_hidden() ? '': (&fenc !=# '' ? &fenc : &enc)
endfunction

function! LightlineFileformat_devicons()
  return s:is_hidden() ? '' : winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFilename() abort
  if s:is_terminal()
    let cmd = substitute(expand('%'), '^!', '', '')
    return fnamemodify(cmd, ':t')
  endif
  if s:is_hidden()
    return ''
  endif
  let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
  let modified = &modified ? ' +' : ''
  return fnamemodify(filename, ":~:.") . modified
endfunction

function! LightlineFiletype_devicons()
  if s:is_hidden()
    return ''
  endif
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineGitblame_coc() abort
  let blame = get(b:, 'coc_git_blame', '')
  let blame_length = winwidth(0) - 65
  if strlen(blame) < winwidth(0) - 65
    return winwidth(0) > 90 ? blame : ''
  endif
  return winwidth(0) > 90 ? blame[:blame_length] . '...' : ''
endfunction

function! LightlineGitinfo_coc() abort
    if s:is_hidden()
      return ''
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    let gitcount=get(b:, 'coc_git_status', '')
    let gitinfo = []
    if empty(gitbranch)
        let gitbranch=""
    endif
    if empty(gitcount)
        let gitcount=""
    endif
    call add(gitinfo,gitbranch)
    call add(gitinfo,gitcount)
    return trim(join(gitinfo,''))
endfunction

function! LightlineLineinfo() abort
    return &filetype ==? 'help'             ? ''  :
    \      &filetype ==? 'tagbar'           ? ' ' :
    \      &filetype ==? 'defx'             ? ' ' :
    \      &filetype ==? 'vim-plug'         ? ' ' :
    \      &filetype ==? 'vista_kind'       ? ' ' :
    \      &filetype ==? 'vista'            ? ' ' :
    \      &buftype  ==? 'terminal'         ? ' ' :
    \      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction


function! LightlineMethod_vista() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '__Tagbar__.1' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ &ft ==# 'defx' ? 'Defx' :
        \ &ft ==# 'tarbar' ? 'Tarbar' :
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineReadonly()
  if s:is_hidden()
    return ''
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" }}}

let g:lightline                   = {}
let g:lightline.colorscheme       = 'deus'
let g:lightline.separator         = {'left': g:symbol_separator_left, 'right': g:symbol_separator_right}
let g:lightline.subseparator      = {'left': g:symbol_subseparator_left, 'right': g:symbol_subseparator_right}
let g:lightline.active            = {
      \ 'left': [['mode', 'paste'], ['readonly', 'cwd'], ['gitbranch', 'modified']],
      \ 'right': [
      \            ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \            ['percent', 'lineinfo'],
      \            ['whitespace', 'fileformat', 'fileencoding'],
      \            ['filetype'], ['cocstatus', 'currentfunction']
      \          ],
      \ }
let g:lightline.inactive = {'left': [['mode'], ['name']],
      \                     'right': [['percent', 'lineinfo']]}
let g:lightline.tabline  = {'left': [['buffers']], 'right': [['tabwidth']]}
let g:lightline.mode_map = {
      \ 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'V', "\<C-v>": 'V',
      \ 'c': 'C', 's': 'S', 'S': 'S', "\<C-s>": 'S', 't': 'T',
      \ }
let g:lightline.component_expand   = {
      \   'buffers': 'lightline#bufferline#buffers',
      \    'linter_checking': 'lightline#ale#checking',
      \    'linter_infos': 'lightline#ale#infos',
      \    'linter_warnings': 'lightline#ale#warnings',
      \    'linter_errors': 'lightline#ale#errors',
      \    'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type     = {
      \   'buffers': 'tabsel',
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'right',
      \   'linter_errors': 'right',
      \   'linter_ok': 'right',
      \ }
let g:lightline.component_function = {
      \   'cwd': 'LightlineCwd',
      \   'gitbranch': 'LightlineGitbranch',
      \   'tabwidth': 'LightlineTabWidth',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'fileencoding': 'LightlineFileencoding',
      \   'fileformat': 'LightlineFileformat_devicons',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype_devicons',
      \   'gitinfo': 'LightlineGitinfo_coc',
      \   'gitblame': 'LightlineGitblame_coc',
      \   'percent': 'LightlinePercent',
      \   'lineinfo': 'LightlineLineinfo',
      \   'method': 'LightlineMethod_vista',
      \   'mode': 'LightlineMode',
      \   'readonly': 'LightlineReadonly',
      \ }


autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:lightline#bufferline#show_number = 2
"let g:lightline#bufferline#composed_number_map = {
"\ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
"\ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
"\ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
"\ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '}

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
