;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load Settings Files
(load! "+keybindings")
(load! "+org")
(load! "+ui")

;; typescript-mode
(after! typescript-mode
  (setq typescript-indent-level 2))
;;ng2-mode
(def-package! ng2-mode :defer t)
;; lsp
(setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-path" "node_modules/typescript/bin/tsserver"))
;; projectile
(setq projectile-project-search-path '("~/projects/"))
