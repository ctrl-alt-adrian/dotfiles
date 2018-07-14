" set leader to comma
let mapleader = ","

" configure spell checking
nmap <silent> <leader>p :set spell!<CR>

" easily manage quick fix windows
map <silent> <C-n> :cnext<CR>
map <silent> <C-m> :cprevious<CR>
nnoremap <silent> <leader>q :cclose<CR>

" rename current file
map <leader>n :call RenameFile()<cr>

" fix indentation in file
map <leader>i mmgg=G`m<CR>

" toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" open buffer explorer
nnoremap ; :BufExplorer<cr>

" unsmart quotes
nnoremap guq :%s/\v[“”]/"/g<cr>

" language server
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Add hotkeys for vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


" wipeout buffer
nmap <silent> <leader>b :bw<cr>

" set paste toggle
set pastetoggle=<leader>v

" textmate style indention
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

