" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" General
syntax enable
" Themes
Plug 'shapeoflambda/dark-purple.vim'
Plug 'doums/darcula'

" Lightline
Plug 'itchyny/lightline.vim'
" lightline theme
" let g:lightline = { 'colorscheme': 'darcula' }
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \		    [ 'gitbranch'],
      \             ['readonly', 'filename', 'modified' ] ],
      \   'right': [ ['percent'], [ 'lineinfo' ],
      \              [ 'filetype', 'fileformat', 'fileencoding' ],
      \              [ 'gitblame', 'currentfunction', 'cocstatus', 'linter_errors', 'linter_warnings'] ]
      \ },
      \ 'component_expand': {
      \ },
      \ 'component_type': {
      \ 	'readonly' : 'error',
      \		'linter_warnings': 'warning',
      \		'linter_errors': 'error'
      \ },
      \ 'component_function': {
      \	  'fileencoding': 'helpers#lightline#fileEncoding',
      \   'filename': 'helpers#lightline#fileName',
      \   'fileformat': 'helpers#lightline#fileFormat',
      \   'filetype': 'helpers#lightline#fileType',
      \   'gitbranch': 'helpers#lightline#gitBranch',
      \	  'cocstatus': 'coc#status',
      \   'currentfunction': 'helpers#lightline#currentFunction',
      \   'gitblame': 'helpers#lightline#gitBlame'
      \ },
      \ 'tabline': {
      \ 'left':  [['tabs']],
      \ 'right': [[ 'close' ]]
      \ },
      \ 'tab': {
      \	  'active': [ 'filename', 'modified'],
      \   'inactive': [ 'filename', 'modified'],
      \	},
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
colorscheme darcula

set termguicolors
set t_Co=256

set autoread " detect when a file is changed
set history=1000 " change history to 1000
set textwidth=120 " may change

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set backspace=indent,eol,start " make backspace behave
set clipboard=unnamed

if has('mouse')
	set mouse=a
endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch "highlight search results
set incsearch " set incremental search
set nolazyredraw " don't redraw while executing macros
set magic " set magic on, for regex
" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Appearance {{{
set number " show line numbers
set linebreak " set soft wrapping
set autoindent " automagically set indent of new line
set ttyfast "faster redrawing
set laststatus=2 " show the status line all the time
set wildmenu "enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tentsh of a second to blink
set updatetime=300
set signcolumn=yes
set shortmess+=c

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts
set pastetoggle=<leader>v " set paste toggle

"edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"

inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nmap <leader>l :set list!<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" substitute, search, and appreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" search inside files
Plug 'wincent/ferret'
" easy peasy commenting
Plug 'tpope/vim-commentary'
" mappings
Plug 'tpope/vim-unimpaired'
" endings for html, xml, etc...
Plug 'tpope/vim-ragtag'
" easily delete, change and add surroundings in pairs
Plug 'tpope/vim-surround'
" better tmux integration
Plug 'benmills/vimux'
" enable repeating other supported commands with the . command
Plug 'tpope/vim-repeat'
" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'AndrewRadev/splitjoin.vim'
" detect indent style
Plug 'tpope/vim-sleuth'
" context-aware pasting
Plug 'sickill/vim-pasta'

" Startify: Fancy startup screen for vim {{{
	Plug 'mhinz/vim-startify'
"}}}


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" html/templates {{{
" emmet for vim
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
" match tags in html
Plug 'gregsexton/MatchTag', { 'for': 'html' }
" html5 support
Plug 'othree/html5.vim', { 'for': 'html' }
" mustache support
Plug 'mustache/vim-mustache-handlebars'
" pug / jade support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug']}
" }}}

" Javascript Development {{{
Plug 'prettier/vim-prettier', {
			\ 'do': 'npm install',
			\ 'for': [
			\'javascript',
			\'typescript',
			\'css',
			\'less',
			\'scss',
			\'sass',
			\'json',
			\'graphql',
			\'markdown',
			\'vue',
			\'yaml',
			\'html'] }

Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_highlight_close_tag = 1
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
" Plug 'pangloss/vim-javascript'
" }}}

" Typescript {{{
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx']}
"}}}

" Styles {{{
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown']}
Plug 'groenewege/vim-less', { 'for': 'less'}
Plug 'hail2u/vim-css3-syntax', { 'for': 'css'}
Plug 'stephenway/postcss.vim', { 'for': 'css'}
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss'}
" }}}

" markdown {{{
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
let g:markdown_fenced_languages = [ 'tsx=typescript.tsx']
" }}}

" JSON {{{
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0
"}}}

" Docker {{{
Plug 'ekalinin/Dockerfile.vim'
" Git {{{
Plug 'tpope/vim-fugitive'
" }}}

" NerdTree {{{
Plug 'scrooloose/nerdtree'
" }}}

" Win tabs
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'







" Initialize plugin system

call plug#end()
