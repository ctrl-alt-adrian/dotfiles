source ~/.config/nvim/plugins.vim
source ~/.config/nvim/deoplete.vim
source ~/.config/nvim/language_client.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/abbreviations.vim

" Colors/Theme {{{
syntax enable
set background=dark
colorscheme material
let g:material_theme_style = 'default'
let g:material_terminal_italics=1
let g:airline_theme='material' " airline theme setting
" }}}

" Base Configuration {{{
set nocompatible
filetype off
filetype plugin indent on

set ttyfast

set laststatus=1
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set smartindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch

" Basic vim settings
set hidden
set visualbell
set number
set nobackup
set noswapfile
set noshowmode

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" Set the terminal's title
set title

" font

" set guifont=Hack:h11

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

" neomake {{{
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_go_enabled_makers = ['go']
let g:neomake_ruby_enabled_makers = ['mri']
" }}}

" mix-format {{{
let g:mix_format_on_save = 1
" }}}

" emmet-vim {{{
" let g:user_emmet_settings = {
"       \  'javascript' : {
"       \      'extends' : 'jsx',
"       \  },
"       \}
" }}}

" vim-markdown {{{
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
" }}}

" vim-go {{{
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" }}}

" vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" vim-test {{{
let test#strategy = "neovim"

" }}}

" vim-polyglot {{{
let g:jsx_ext_required = 0
" }}}

" Completion & Snippets {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Load personal snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
" }}}

" Ctrlp {{{

let g:ctrlp_match_window = "bottom,order:btt"   " Order file matches from bottom to top
let g:ctrlp_dont_split = 'netrw'                " Prevent from opening a new window
let g:ctrlp_working_path_mode = 0               " Don't change working directory based on current buffer

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  " Use the silver search if ripgrep is missing
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U'
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " Persist the CtrlP cache
  let g:ctrlp_use_caching = 1                     " Enable CtrlP caching
endif

" }}}

" Auto-commands {{{
if has("autocmd")
  " always start terminal in insert mode
  autocmd BufWinEnter,WinEnter term://* startinsert

  " Execute NeoMake makers
  autocmd BufWritePost * Neomake
  " autocmd BufReadPost * Neomake

  " StripTrailingWhitespaces
  autocmd BufWritePre * Stripwhitespace

  " To spell check all git commit messages
  au BufNewFile,BufRead COMMIT_EDITMSG set spell nonumber nolist wrap linebreak

  " Set filetype tab settings
  autocmd FileType ruby,json,haml,eruby,yaml,html,javascript,coffee,sass,cucumber,stylus,css,xml,htmldjango set ai ts=2 sw=2 sts=2 et
  autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et

  " Enable auto-completion
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

  " Set Syntax Highlighting for odd file types
  augroup filetypedetect
    au BufNewFile,BufRead .gitconfig,.git/* set noet
    au BufNewFile,BufRead Dockerfile* setf dockerfile
    au BufNewFile,BufRead *.fizz setf fizz
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  augroup END

  " Set Ruby specific settings
  au FileType ruby nmap <leader>bp orequire "pry"; binding.pry<esc>^

  " Set Elixir specific settings
  au FileType elixir nmap <leader>bp orequire IEx; IEx.pry<esc>^

  " Set Go specific mappings
  au FileType go set ai ts=2 sw=2 sts=2 noet nolist autowrite
  au FileType fizz set ai ts=2 sw=2 sts=2 noet nolist autowrite

  " Set ERB specific settings
  au FileType eruby nmap <leader>bp o<% require "pry"; binding.pry %><esc>^

  " Restore cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

"}}}
