" configure_fixers
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
let g:NERDTreeBrow
\}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']

" better ale defaults
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0
