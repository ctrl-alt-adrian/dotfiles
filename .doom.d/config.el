;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load Settings Files
(load! "+keybindings")
(load! "+org")
(load! "+ui")

;; fix flickering issue
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; program mode settings
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; typescript-mode
(after! typescript-mode
  (add-hook 'typescript-mode-hook #'flycheck-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  (setq typescript-indent-level 2))
;; ng2-mode
(after! ng2-mode
  :defer t)
;; javascript
(after! javascript #'lsp
  (setq js-indent-level 2
      js-basic-offset 2))

;; eslint
(setq +set-eslint-checker nil)
;; web-mode
(after! web-mode
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (setq web-mode-markup-indent-offset 2
        web-mode-enable-current-element-highlight t
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil
        web-mode-auto-close-style 2))
;; css
(setq css-indent-offset 2)
;; json
(setq json-reformat:indent-width 2)
;; lsp
(after! lsp
 (setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-path" "node_modules/typescript/bin/tsserver")
       lsp-ui-sideline-show-code-actions nil
       lsp-ui-sideline-show-diagnostics nil
       lsp-signature-render-all nil))
;; projectile
(setq projectile-project-search-path '("~/projects/" "~/work/media-sourcery/"))
;; tide-mode
(setq tide-format-option '(:indentSize 2 :tabSize 2 :convertTabsToSpaces t ))
(after! tide-mode
  (setq-hook! (typescript-mode . tide-setup)))
