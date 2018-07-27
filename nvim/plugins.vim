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

" plug
call plug#begin('~/.config/nvim/plugged')

" editor - general
" ************************************************
Plug 'itchyny/lightline.vim'                " lighter statusbar
Plug 'sickill/vim-pasta'
Plug 'nicknisi/vim-base16-lightline'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'					" File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'				" Add filetype gliph icons
Plug 'jlanzarotta/bufexplorer'              "Switch between buffers

" editor - editing coding focused
" ************************************************
Plug 'Raimondi/delimitMate'                 " Automatic closing of quotes, parens, etc
Plug 'vim-scripts/matchit.zip'              " Match all the things
Plug 'easymotion/vim-easymotion'            " Vim motion on speed
Plug 't9md/vim-textmanip'                   " Move/Duplicate text intuitively
Plug 'matze/vim-move'                       " Move lines and selections up and down
Plug 'coderifous/textobj-word-column.vim'   " Word based column manager
Plug 'chrisbra/NrrwRgn'                     " A Vim plugin for select region editing
" Plug 'docunext/closetag.vim'              " auto close (X)HTML tags
Plug 'rhysd/accelerated-jk'                 " Acellerate up-down moving
Plug 'craigemery/vim-autotag'               " autogenerate ctags
Plug 'terryma/vim-multiple-cursors'         " Sublime Text multi-currsor support

" Tim Pope's plugins
" ************************************************
Plug 'tpope/vim-sensible'                   " Defaults everyone can agree on
Plug 'tpope/vim-fugitive'                   " Git
Plug 'tpope/vim-rhubarb'                    " Hub
Plug 'tpope/vim-repeat'                     " Better map repeating
Plug 'tpope/vim-surround'                   " Surround selection with entry
Plug 'tpope/vim-commentary'                 " Comment stuff out
Plug 'tpope/vim-endwise'                    " Adds 'end' after several keywords in Ruby & Vimscript
Plug 'tpope/vim-ragtag'                     " Mappings for HTML, XML, PHP, ASP, eRuby, JSP, etc
Plug 'tpope/vim-sleuth'                     " Adjusts 'shiftwidth' and 'expandtab' automagically
Plug 'tpope/vim-dispatch'                   " Asynchronous build and test dispatcher

" search fzf b2b ack 
" ************************************************
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'                      " search with ack within Vim

" language server
" ************************************************
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" language server plugins
" ************************************************
Plug 'sourcegraph/javascript-typescript-langserver'     " JavaScript/TypeScript Language Server
Plug 'vscode-langservers/vscode-css-languageserver-bin' " CSS/LESS/SCSS Language Server

" syntax
" ************************************************
Plug 'sheerun/vim-polyglot'     " syntax highlighing for all the things!

" typescript
" ************************************************
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript', 'do': './install.sh' }
Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

" html
" ************************************************
Plug 'othree/html5.vim', { 'for': 'html' }              " HTML5 omnicomplete & syntax
Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
Plug 'skwp/vim-html-escape'
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }  " jade/pug support
Plug 'alvan/vim-closetag'                               " Autoclose (X)HTML tags
Plug 'stephpy/vim-yaml'                                 " Make YAML suck less

" css
" ************************************************
Plug 'ap/vim-css-color'                         "Highlight CSS3 colors
" Plug 'hail2u/vim-css3-syntax'                   "CSS3 syntax highlighter
" Plug 'cakebaker/scss-syntax.vim'                "SCSS syntax highlighter
" Plug 'groenewege/vim-less'                      "LESS syntax highlighter
Plug 'othree/csscomplete.vim'                   "Update built-in CSS complete function to latest standerd
Plug 'styled-components/vim-styled-components'  "Bundle for Styled components
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }

" code completion / autocomplete
" ************************************************
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" testing
" ************************************************
Plug 'janko-m/vim-test'               "A Vim wrapper for running tests
Plug 'craigdallimore/vim-jest-cli'                                " Jest CLI for VIM

" linting
" ************************************************
Plug 'w0rp/ale'                 " Asynchronous Lint Engine

" moar git!!!
" ************************************************
Plug 'airblade/vim-gitgutter'   " Show git diff in the gutter

" writing
" ************************************************
Plug 'junegunn/limelight.vim'   " hyperfocused writing in vim
Plug 'junegunn/goyo.vim'        " destraction free writing in vim


call plug#end()
