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

" editor
Plug 'itchyny/lightline.vim'                    "lighter statusbar
Plug 'sickill/vim-pasta'
Plug 'nicknisi/vim-base16-lightline'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'						"File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'					"Add filetype gliph icons
Plug 'docunext/closetag.vim'                    " auto close (X)HTML tags
Plug 'rhysd/accelerated-jk'                 "Acellerate up-down moving

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

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'          " search with ack within Vim

" syntax
Plug 'sheerun/vim-polyglot'     " syntax highlighing for all the things!

call plug#end()
