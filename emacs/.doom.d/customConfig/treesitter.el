;;; customConfig/treesitter.el -*- lexical-binding: t; -*-

;; treesitter config
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
