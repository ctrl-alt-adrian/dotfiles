" colorscheme settings
" ************************************************
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_invert_selection='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc[38;2;%lu;%lu;%lum"
    let &t_8b = "\<>Esc>[48;2;%lu;%lu;%lum"
endif

" sonokai styles
let g:sonokai_style = "shusia"
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0

" indentLine
" ************************************************
" let g:indentLine_setColors = 0
" let g:indentLine_char='|'

