" disable autocomplete by default
"let b:deoplete_disable_auto_complete=1
"let g:deoplete_disable_auto_complete=1


let g:deoplete#enable_at_startup  = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case  = 1
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview

" set sourcers to be empty by default
let g:deoplete#sources = {}

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

let g:deoplete#sources.python = ['LanguageClient']
