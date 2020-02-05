"=============================================================================
" markdown.vim --- markdown specific configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

Pack 'tpope/vim-markdown', {'for': 'markdown'}
Pack 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Pack 'iamcco/markdown-preview.nvim', {'for': 'markdown',
                                      \'do': {-> system('cd app & yarn install')} }


let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

let g:mkdp_command_for_global = 1

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
