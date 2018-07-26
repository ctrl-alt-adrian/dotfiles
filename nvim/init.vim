source ~/.config/nvim/plugins.vim
source ~/.config/nvim/emmet.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/deoplete.vim
source ~/.config/nvim/language_client.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/abbreviations.vim

" Colors/Theme {{{
syntax enable           "Turn on syntax highlighting
syntax on               "Turn on syntax highlighting
set background=dark
colorscheme solarized8_flat
" let g:material_theme_style = 'default'
" let g:material_terminal_italics=1
" let g:airline_theme='material' " airline theme setting
let g:solarized_term_italics=1
let g:solarized_termcolors=256
let g:airline_theme='solarized' " airline theme setting
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" }}}

" Base Configuration {{{
set nocompatible
filetype off
filetype plugin indent on
set termguicolors
set ttyfast
set laststatus=1
set encoding=utf-8              " Set default encoding to UTF-8
scriptencoding utf-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set smartindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch
set splitright                                                  " Split vertical windows right to the current windows
set splitbelow                                                  " Split horizontal windows below to the current windows
set autowrite                                                   " Automatically save before :next, :make etc.

set showcmd                                                     " Show command
set showmatch                                                   " Do not show matching brackets by flickering
set matchtime=3                                                 " speed up showmatch
" Basic vim settings
set hidden
set visualbell
set number
set nobackup
set noswapfile
set noshowmode

" Auto: highlight paren match color control
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=blue

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Set the terminal's title
set title
" omni completion
filetype plugin on
" Global tab width.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Set to show invisibles (tabs & trailing spaces) & their highlight color
set list listchars=tab:»\ ,trail:·

" Configure spell checking
set spelllang=en_us

" Send all vim registers to the mac clipboard
set clipboard=unnamed

" Default to magic mode when using substitution
cnoremap %s/ %s/\v
cnoremap \>s/ \>s/\v
" }}}

" Terminal Mode Configuration {{{
" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>
" }}}

" Helper Functions and Mappings {{{

" Capture current file path into clipboard
function! CaptureFile()
  let @+ = expand('%')
endfunction
map <leader>f :call CaptureFile()<cr>

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Strip whitespace on save
fun! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfun

command -nargs=0 Stripwhitespace :call <SID>StripTrailingWhitespaces()

" change history to 1000
set history=1000

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
  set termguicolors
endif

" }}}


" mix-format {{{
let g:mix_format_on_save = 1
" }}}

" Completion & Snippets {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Load personal snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" }}}

" make comments and HTML attributes italic
" ************************************************
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

" Accellerated J/K
" ************************************************
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" vim-closetag/delimitMate conflict resolution/fix
" ************************************************

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:},[:]"

" omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css,scss,sass,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType jsx,js setlocal omnifunc=javascriptcomplete#CompleteJS " removed javascript before jsx
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Indent line display
let g:indentLine_char = '|'

set completeopt-=longest
set completeopt+=noinsert
"}}}
