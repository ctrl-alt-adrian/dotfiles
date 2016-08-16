"set shell=/bin/bash " because vundle trips when install plugins in zsh"
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rails'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'alvan/vim-closetag'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'sickill/vim-pasta'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"============================================================="
" Pathogen
execute pathogen#infect()
"========================"
" Y U No SSL?"
let $GIT_SSL_NO_VERIFY = 'true'

" GENERAL

set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed " clipboard
set ttyfast " faster redrawing
set mouse=a " mouse support"
" UI "
set number " set line number
set encoding=utf8
let base16colorspace=256 " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme kolor
syntax on "switch syntax highliting on
set list " show whitespace and tabs
set listchars=eol:¬,tab:··,extends:>,precedes:<,trail:·,
set tabstop=4 shiftwidth=4 expandtab
" Invisible character colors
highlight NonText guifg=#515050
highlight SpecialKey guifg=#515050
set ruler  "Always show current position
set nobackup  " Turn off backup
set nowb
set noswapfile
set cursorline  " hilight the line the cursor is on
set guifont=Hack:h16
" UX "
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
" set color colums
set textwidth=80 "" maxum number the column is
set colorcolumn=+1 " where to put the line"
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing marcos
set magic " Set magic on, for regex
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set autoindent " automatically set indent of new line
set smartindent
set laststatus=2 " show the satus line all the time

" Key maps  "
" instead of typing dd, just hit leader d to delete the line
nnoremap <Leader>d dd
" deletes the line and puts you into insert mode in one swoop
nnoremap -c ddO
" toggle between 'set list'
nmap <Leader>l :set list!<CR>
" Enforce Purity
" normal mode arrow key disable
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" visual mode arrow key disable
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" Help searches navigation
nmap <silent>  <RIGHT>         :cnext<CR>
nmap <silent>  <RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <silent>  <LEFT>          :cprev<CR>
nmap <silent>  <LEFT><LEFT>    :cpfile<CR><C-G>
" Plugin settings "
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" " show hidden files in NERDTree
let NERDTreeShowHidden=1
" " Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" " expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" -- Airline --
let g:airline_powerline_fonts = 1
set timeoutlen =85 " decreases delay from  insert to  normal mode causes conflict with leader key. perhaps I must set the leader key to toggle faster
set noshowmode " gets rid of default mode indicator
let g:airline#extensions#tabline#enabled = 1 " auto display all buffers when there is only one tab open.
let g:airline_theme = 'badwolf'
let g:airline = 'fancy'
"set fillchars+=stl:\ ,stlnc:\
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" -- easymotion --
" default setup
" " -- fuzzyfinder --
" map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <Leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<Leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
             \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
             \ 'file': '\.exe$\|\.so$'
             \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
" -- indentLine --
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
" emmet
let g:user_emmet_mode='a'
" -- css3 color --
let g:cssColorVimDoNotMessMyUpdatetime = 1
" -- vim autocomplete --
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
