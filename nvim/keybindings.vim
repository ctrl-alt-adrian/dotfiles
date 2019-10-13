" general
" ************************************************
let mapleader = "," " set leader to comma
set pastetoggle=<leader>v " set paste toggle

" configure spell checking
nmap <silent> <leader>p :set spell!<CR>

" easily manage quick fix windows
map <silent> <C-n> :cnext<CR>
map <silent> <C-m> :cprevious<CR>
nnoremap <silent> <leader>q :cclose<CR>

" accellerated j/k
" nmap j <Plug>(accelerated_jk_gj)
" nmap k <Plug>(accelerated_jk_gk)

" rename current file
map <leader>n :call RenameFile()<cr>

" fix indentation in file
map <leader>i mmgg=G`m<CR>

" toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" open buffer explorer
nnoremap <leader>; :BufExplorer<cr>

" unsmart quotes
nnoremap guq :%s/\v[“”]/"/g<cr>

" wipeout buffer
nmap <silent> <leader>b :bw<cr>

" textmate style indention
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" fzf
" ************************************************
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" NERDTree
" ************************************************
" toggle nerd tree
nmap <C-\> :NERDTreeToggle<CR> " open NERDTree w ctrl \
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

" language server
" ************************************************
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" misc
" ************************************************
" neovim terminal normal mode
" tmap <esc> <c-\><c-n><esc><cr>
" open up terminal in split below
" nnoremap <leader>` :below 10sp term://$SHELL<cr>

" vim-test
" ************************************************
" Add hotkeys for vim-test
" nmap <silent> <leader>t :TestFile<CR>
" nmap <silent> <leader>T :TestNearest<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
