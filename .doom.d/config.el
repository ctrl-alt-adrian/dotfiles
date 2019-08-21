;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load Settings Files
(load! "+keybindings")
(load! "+org")
(load! "+ui")

;; global settings
;; (setq mac-command-modifier 'meta)
;; typescript-mode
(after! typescript-mode
  (setq typescript-indent-level 2))
;; ng2-mode
(def-package! ng2-mode :defer t)
;; javascript
(setq js-indent-level 2
      js-basic-offset 2)
;; eslint
(setq +set-eslint-checker nil)
;; web-mode
(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil
        web-mode-auto-close-style 2))
;; css
(setq css-indent-offset 2)
;; json
(setq json-reformat:indent-width 2)
;; lsp
(setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-path" "node_modules/typescript/bin/tsserver"))
;; projectile
(setq projectile-project-search-path '("~/projects/"))
