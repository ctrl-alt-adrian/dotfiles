" NERDTree {{{
let NERDTreeMapOpenInTab='\r'
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 25
let g:NERDSpaceDelims = 1	" add spaces after comment delimiters by default
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:netrw_browse_split=2
let g:netrw_banner = 0

 augroup nerdtree
         autocmd!
     autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
     autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

let NERDTreeAutoDeleteBuffer = 1    " delete buffer of the file you deleted w NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
                \}
" }}}

