" let g:lightline = {
"   \   'active': {
"   \     'left':[ [ 'mode', 'paste' ],
"   \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
"   \     ]
"   \   },
"   \   'component': {
"   \     'lineinfo': ' %3l:%-2v',
"   \   },
"   \   'component_function': {
"   \     'gitbranch': 'fugitive#head',
"   \   }
"   \ }
" let g:lightline.separator = {
"   \   'left': '', 'right': ''
"   \}
" let g:lightline.subseparator = {
"   \   'left': '', 'right': ''
"   \}

" let g:lightline.tabline = {
"   \   'left': [ ['tabs'] ],
"   \   'right': [ ['close'] ]
"   \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
        let g:lightline = {
        \   'colorscheme': 'onedark',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \               [ 'gitbranch' ],
        \               [ 'readonly', 'filetype', 'filename' ]],
        \       'right': [ [ 'percent' ], [ 'lineinfo' ],
        \               [ 'fileformat', 'fileencoding' ],
        \               [ 'linter_errors', 'linter_warnings' ]]
        \   },
        \   'component_expand': {
        \       'linter': 'LightlineLinter',
        \       'linter_warnings': 'LightlineLinterWarnings',
        \       'linter_errors': 'LightlineLinterErrors',
        \       'linter_ok': 'LightlineLinterOk'
        \   },
        \   'component_type': {
        \       'readonly': 'error',
        \       'linter_warnings': 'warning',
        \       'linter_errors': 'error'
        \   },
        \   'component_function': {
        \       'fileencoding': 'LightlineFileEncoding',
        \       'filename': 'LightlineFileName',
        \       'fileformat': 'LightlineFileFormat',
        \       'filetype': 'LightlineFileType',
        \       'gitbranch': 'LightlineGitBranch'
        \   },
        \   'tabline': {
        \       'left': [ [ 'tabs' ] ],
        \       'right': [ [ 'close' ] ]
        \   },
        \   'tab': {
        \       'active': [ 'filename', 'modified' ],
        \       'inactive': [ 'filename', 'modified' ],
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '', 'right': '' }
        \ }
