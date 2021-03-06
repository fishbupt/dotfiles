"=============================================================================
" leaderf.vim --- leaderf configuration
" Author: fishbupt <fishbupt@gmail.com>
"=============================================================================

if WIN()
  "TODO: nvim on window has bug, need to pass args
  Pack 'Yggdroot/LeaderF', { 'do': {hook, name -> system('install.bat')}}
else
  Pack 'Yggdroot/LeaderF', { 'do': {-> system('install.sh')}}
endif

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_PopupColorscheme = 'gruvbox_material'

" popup mode
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2"}
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_RgConfig = [
      \ "--max-columns=150",
      \ "--glob=!git/*",
      \ "--hidden"
      \ ]
" let g:Lf_ShortcutF = '<leader>ff'
" let g:Lf_ShortcutB = '<leader>bb'
noremap <C-F> :<C-U><C-R>=printf("Leaderf --popup --nameOnly file %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf --popup --nameOnly buffer %s", "")<CR><CR>
noremap <C-G> :<C-U><C-R>=printf("Leaderf --popup --nameOnly rg -F %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>fb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
