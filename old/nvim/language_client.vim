" required for operations modifying multiple buffers like rename.
set hidden

" automatically start language servers.
let g:LanguageClient_autoStart = 1

" set language client servers
let g:LanguageClient_serverCommands = {
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-langserver'],
    \ 'javascript.jsx': ['javascript-typescript-langserver'],
    \ 'css': ['vscode-css-languageserver-bin'],
    \ }
