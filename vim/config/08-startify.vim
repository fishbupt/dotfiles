let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.vim/session'
" TODO: delete Defx buffer
let g:startify_session_before_save = [
      \ 'echo "Cleaning up before saving.."',
      \ 'TagbarClose',
      \ 'DefxClose',
      \ ]

let g:startify_custom_header = [
      \ '$$\    $$\ $$$$$$\ $$\      $$\         $$$$$$$\   $$$$$$\  $$\      $$\ $$$$$$$$\ $$$$$$$\  ',
      \ '$$ |   $$ |\_$$  _|$$$\    $$$ |        $$  __$$\ $$  __$$\ $$ | $\  $$ |$$  _____|$$  __$$\ ',
      \ '$$ |   $$ |  $$ |  $$$$\  $$$$ |        $$ |  $$ |$$ /  $$ |$$ |$$$\ $$ |$$ |      $$ |  $$ |',
      \ '\$$\  $$  |  $$ |  $$\$$\$$ $$ |$$$$$$\ $$$$$$$  |$$ |  $$ |$$ $$ $$\$$ |$$$$$\    $$$$$$$  |',
      \ ' \$$\$$  /   $$ |  $$ \$$$  $$ |\______|$$  ____/ $$ |  $$ |$$$$  _$$$$ |$$  __|   $$  __$$< ',
      \ '  \$$$  /    $$ |  $$ |\$  /$$ |        $$ |      $$ |  $$ |$$$  / \$$$ |$$ |      $$ |  $$ |',
      \ '   \$  /   $$$$$$\ $$ | \_/ $$ |        $$ |       $$$$$$  |$$  /   \$$ |$$$$$$$$\ $$ |  $$ |',
      \ '    \_/    \______|\__|     \__|        \__|       \______/ \__/     \__|\________|\__|  \__|',
      \'',
      \ '                             by fishbupt <fishbupt@gmail.com>',
      \ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

nnoremap <leader>h :Startify<CR>
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sl :SLoad<CR>
nnoremap <leader>sc :SClose<CR>
nnoremap <leader>sd :SDelete<CR>
