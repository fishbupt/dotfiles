function! myspacevim#before() abort
    call SpaceVim#logger#info('myspacevim#before called')
    " use , as `<Leader>`
    let g:mapleader = ","
endfunction

function! myspacevim#after() abort
    call SpaceVim#logger#info('myspacevim#after called')
    
    " fzf customization
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


    " Useful key mappings
    nmap <leader>. :bprevious<cr>
    nmap <leader>, :bnext<cr>
    " noremap <leader> / nohighlight<CR>
    noremap H ^
    noremap L g_
    noremap <Down> 5j
    noremap <Up> 5k
    " format code
    noremap <M-f> :Neoformat<CR>
    " comment
    vnoremap <c-/> :TComment<CR>
    map <C-f> :Files<cr>
    map <C-b> :Buffers<cr>
    nmap <C-c> :Commits<cr>
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
    " Ack key maps
    nnoremap <F12> :Ag <C-R><C-W><CR>


    " command to close all buffers but current on
    command! BufOnly silent! execute "%bd|e#|bd#"
endfunction
