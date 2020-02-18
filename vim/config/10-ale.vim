"=============================================================================
" ale.vim --- ale configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

Pack 'dense-analysis/ale'

let g:ale_set_signs = 1
let g:ale_sign_priority = 100
let g:ale_sign_highlight_linenr = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_set_balloons = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save =  1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_options = '--ignore=F821,E501'
let g:ale_python_pylint_options = '--disable=C0111,C0301,R0902,R0903,R0913,R0914,R0915,E1101,E1004'

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \ }
let g:ale_fixers = {
      \   'python': ['autopep8'],
      \ }
let g:ale_lint_on_text_changed = 0
let g:ale_lint_delay = 750
let g:ale_python_flake8_options = '--ignore=F811,F821,E501'
let g:ale_python_pylint_options = '--extension-pkg-whitelist=PyQt5 --disable=C0111,C0301,R0902,R0903,R0913,R0914,R0915,E1101,E1004'

if g:colors_name ==# 'gruvbox'
  highlight link ALEErrorSign GruvboxRedSign
  highlight link ALEWarningSign GruvboxYellowSign
else
  highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
  highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
endif

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>fx <Plug>(ale_fix)
