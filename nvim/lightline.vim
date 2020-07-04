set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
let g:lightline = {
      \   'colorscheme': 'sonokai',
      \   'active': {
      \     'left': [ [ 'mode', 'paste'],
      \               [ 'gitbranch', 'readonly', 'filename', 'modofied'] ]
      \   },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

