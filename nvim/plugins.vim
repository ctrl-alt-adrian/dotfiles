"check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
 if !filereadable(plugpath)
  ¦ if executable('curl')
  ¦ ¦ ¦ let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ¦ ¦ ¦ call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
  ¦ ¦ ¦ if v:shell_error
  ¦ ¦ ¦ ¦ ¦ echom "Error downloading vim-plug. Please install it manually.\n"
  ¦ ¦ ¦ ¦ ¦ exit
  ¦ ¦ ¦ endif
  ¦ else
  ¦ ¦ ¦ echom "vim-plug not installed. Please install it manually or install curl.\n"
  ¦ ¦ ¦ exit
  ¦ endif
endif"

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

" Autocomplete
Plug 'tweekmonster/deoplete-clang2'
Plug 'Shougo/neco-vim'
Plug 'ujihisa/neco-look'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', {'build': 'make'}
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
"
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
autocmd BufEnter * call ncm2#enable_for_buffer() "setup for ncm2
set completeopt=noinsert,menuone,noselect

" Snippet support to vim
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Tim Pope's plugins
Plug 'tpope/vim-sensible'   "Defaults everyone can agree on
Plug 'tpope/vim-fugitive'   "Git
Plug 'tpope/vim-rhubarb'    "Hub
Plug 'tpope/vim-repeat'     "Better map repeating
Plug 'tpope/vim-surround'   "Surround selection with entry
Plug 'tpope/vim-commentary' "Comment stuff out
Plug 'tpope/vim-endwise'    "Adds 'end' after several keywords in Ruby & Vimscript
Plug 'tpope/vim-ragtag'     "Mappings for HTML, XML, PHP, ASP, eRuby, JSP, etc
Plug 'tpope/vim-sleuth'     "Adjusts 'shiftwidth' and 'expandtab' automagically
Plug 'tpope/vim-dispatch'   "Asynchronous build and test dispatcher

" editor
Plug 'terryma/vim-multiple-cursors'         "Sublime Text multi-currsor support
Plug 'jlanzarotta/bufexplorer'              "Switch between buffers
Plug 'scrooloose/nerdtree'                  "File system explorer
Plug 'plasticboy/vim-markdown'              "Markdown support
Plug 'mattn/emmet-vim'                      "Provides Emmit support
Plug 'Raimondi/delimitMate'                 "Automatic closing of quotes, parens, etc
Plug 'mileszs/ack.vim'                      "Search with ack within Vim
Plug 'ervandew/supertab'                    "Allows <Tab> for all insert completions
Plug 'AndrewRadev/splitjoin.vim'            "Support for multi & single line code
Plug 'vim-scripts/matchit.zip'              "Match all the things
Plug 'sickill/vim-pasta'                    "Pasting in vim with indention
Plug 'Yggdroot/indentLine'                  "Display indention levels with lines
Plug 'easymotion/vim-easymotion'            "Vim motion on speed
Plug 't9md/vim-textmanip'                   "Move/Duplicate text intuitively
Plug 'matze/vim-move'                       "Move lines and selections up and down
Plug 'coderifous/textobj-word-column.vim'   "Word based column manager
Plug 'rhysd/accelerated-jk'                 "Acellerate up-down moving
Plug 'wellle/targets.vim'                   "Additional text targets
Plug 'chrisbra/NrrwRgn'                     "A Vim plugin for select region editing
Plug 'wincent/command-t'                    "Fast file navigation for Vim

" Linting
Plug 'w0rp/ale'                             "Asynchronous Lint Engine

" Git
Plug 'airblade/vim-gitgutter'               "Show git diff in the gutter

" Typescript
Plug 'mhartington/deoplete-typescript'
Plug 'Quramy/tsuquyomi'                     "Vim plugin for Typescript
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For Denite features
Plug 'Shougo/denite.nvim'

"Angular
Plug 'burnettk/vim-angular'                  "Angular syntax

" Javascript
"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'elzr/vim-json'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'Quramy/vison'
Plug 'mustache/vim-mustache-handlebars'         "Mustache & Handlebar support
Plug 'neoclide/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \}
Plug 'sourcegraph/javascript-typescript-langserver'               " JavaScript/TypeScript Language Server
Plug 'felixfbecker/php-language-server'                           " PHP Language Server
Plug 'vscode-langservers/vscode-css-languageserver-bin'           " CSS/LESS/SCSS Language Server

" HTML
Plug 'othree/html5.vim'                         "HTML5 omnicomplete & syntax
Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
Plug 'posva/vim-vue'
Plug 'skwp/vim-html-escape'
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'alvan/vim-closetag'                       "Autoclose (X)HTML tags
Plug 'stephpy/vim-yaml'                         "Make YAML suck less

" CSS
Plug 'ap/vim-css-color'                         "Highlight CSS3 colors
Plug 'hail2u/vim-css3-syntax'                   "CSS3 syntax highlighter
Plug 'cakebaker/scss-syntax.vim'                "SCSS syntax highlighter
Plug 'groenewege/vim-less'                      "LESS syntax highlighter
Plug 'othree/csscomplete.vim'                   "Update built-in CSS complete function to latest standerd
Plug 'styled-components/vim-styled-components'  "Bundle for Styled components

" Java

" Elm
Plug 'elmcast/elm-vim'                "Elm support

" Python
Plug 'roxma/python-support.nvim'

" Go
Plug 'fatih/vim-go'                   "Go development for Vim

" Vim, Tmux, and Airline theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "Themes for airline
Plug 'ryanoasis/vim-devicons'         "Add filetype gliph icons
Plug 'kaicataldo/material.vim'        "Material theme
Plug 'lifepillar/vim-solarized8'      "Solarized theme that works

" Testing
Plug 'janko-m/vim-test'               "A Vim wrapper for running tests
Plug 'craigdallimore/vim-jest-cli'                                " Jest CLI for VIM
Plug 'retorillo/istanbul.vim'                                     " Visualize code coverage and summarize uncoered lines into quickfix by reading coverage.json

" Install polyglot for language plugins
Plug 'sheerun/vim-polyglot'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1


call plug#end()
