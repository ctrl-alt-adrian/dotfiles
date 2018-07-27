" general
" ************************************************
let mapleader = "," " set leader to comma
set pastetoggle=<leader>v " set paste toggle

" accellerated j/k
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

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

