" load configs
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/NERDTree.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/emmet.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/abbreviations.vim
source ~/.config/nvim/vimconfigs.vim

" general
" ************************************************
set nocompatible
set laststatus=1
set encoding=UTF-8
scriptencoding UTF-8
set autoread " detect when a file is changed
set autowrite " automagically save before :next, :make, etc
set history=1000 " change history to 1000
set textwidth=120
set inccommand=nosplit " don't split when subsituting
set backspace=indent,eol,start " make backspace behave in a sane manner
autocmd BufLeave,FocusLost * silent! wall " safe file on focus loss
set updatetime=50
set nowrap
set shortmess+=c     "don't pass messages to ins-completion-menu. 

" no swap or backup files
" ************************************************
set noswapfile
set nobackup
set nowritebackup

" searching
" ************************************************
set ignorecase 		" case insensitive searching
set smartcase 		" case-sensitive if expresson contains a capital letter
set hlsearch		" highlight search results
set incsearch		" set incremental search, like modern browsers
set nolazyredraw	"don't redraw while executing macros
let g:ackprg = 'ag --nogroup --nocolor --column' " enable ag instead of ack
set magic 		" set magic on for regex
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' 
" clear highlight search
" noremap <space> :set hlsearch! hlsearch?<cr>
" allows ripgrep to detect root
if executable('rg')
	let g:rg_derive_root='true'
endif
" error bells
" ************************************************
set noerrorbells
set visualbell
set t_vb=
set tm=500
set clipboard+=unnamedplus
set pastetoggle=<f6>
set nopaste
set splitright                                                  " Split vertical windows right to the current windows
set splitbelow                                                  " Split horizontal windows below to the current windows

" auto: highlight paren match color control
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermbg=196 
filetype plugin indent on
filetype plugin on

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Set to show invisibles (tabs & trailing spaces) & their highlight color
set list listchars=tab:»\ ,trail:·

" apperance
" ************************************************
syntax on
set number		" show line numbers
"set relativenumber	" show relative line numbers
set wrap		" turn on line wrapping
set wrapmargin=8	" wrap lines when coming withing n characters
set linebreak		" set soft wrapping
set autoindent		" automagically set indent of new line
set ttyfast		" faster redrawing
set diffopt+=vertical
set laststatus=2 	" show status line at all time
set so=7 		" set 7 lines to the cursors - when moving vertical
set wildmenu 		" enhance command line completion
set hidden 		" current buffer can be put into background
set showcmd 		" show incomplete commands
set noshowmode 		" don't show which mode disabled for Powerline
set wildmode=list:longest " complete files like a shell
set scrolloff=3 	" lines of text around cursor
set shell=$SHELL
set cmdheight=1 	" command bar height
set title 		" set terminal title
set showmatch 		" show matching braces
set mat=2 		" how many tenths of a second to blink
set cursorline

" colorscheme
" ************************************************
set termguicolors
set background=dark

colorscheme  sonokai 


" tab control
" ************************************************
set noexpandtab 	" insert tabs rather than spaces for <Tab>
set smarttab 		" tab respects 'tabstop', 'shifwidth', and 'softtabstop'
set smartindent
set tabstop=2 		" the visible width of tabs
set softtabstop=2 	" edit as if the tabs are 4 characters wide
set shiftwidth=2	" number of spaces to use for indent and unindent
set shiftround 		" round indent to a multiple of 'shiftwidth'
set undodir=../nvim/undodir
set undofile
set incsearch

" dev icons
" ************************************************
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" code folding settings
" ************************************************
" toggle invisible characters

" enable 24 bit color if supported
" ************************************************
if !has('gui_running')
	set t_Co=256		" Tell vim that the terminal supports 256 colors
endif
" set t_Co=256		" Tell vim that the terminal supports 256 colors
set termguicolors

if &term =~ '256color'
	" disable background color erase
	set t_ut=
endif

if (has('mac') && empty($TMUX) && has("termguicolors"))
	set termguicolors
endif

" ctags stuff
" ************************************************
command! MakeTags !ctags -R --exclude=node_modules .

" make comments and HTML attributes italic
" ************************************************
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

" coding
" ************************************************
augroup filetype javascript syntax=javascript

" other shizz
set mouse=a	" enable le mouse
" ************************************************
" Load personal snippets
" let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" vim-closetag/delimitMate conflict resolution/fix
" let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"
" au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:},[:]"

" Indent line display
let g:indentLine_char = '|'

" let g:deoplete#enable_at_startup = 1		" start deoplete 
" guyo + limelight integration
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" don't run typescript diagnostics by default
" let g:nvim_typescript#diagnosticsEnable = 0

" neovim terminal
" ************************************************
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide

" git gutter
" ************************************************
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" let g:gitgutter_enabled = 1
" let g:gitgutter_map_keys = 0
let g:gitgutter_set_sign_backgrounds = 1

