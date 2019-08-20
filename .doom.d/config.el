;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load Settings Files
(load! "+keybindings")
(load! "+org")
(load! "+ui")

;; snippets

(after! typescript-mode
  (add-hook 'typescript-mode-hook #'flycheck-mode)
  (setq typescript-indent-level 2))

;; angualar
(def-package! ng2-mode
  :after typescript-mode)

(setq js-indent-level 2
      js2-basic-offset 2)

(setq +set-eslint-checker nil)

;;(set company-idle-delay 0.1)

(after! web-mode
  (add-hook 'web-mode-hook #'flycheck-mode)

  (setq web-mode-markup-indent-offset 2 ;; indentation
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil
        web-mode-auto-close-style 2))


;; typescript
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (setq typescript-indent-level 2)
;; tell tide to look at node
(setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
;; General
;; EVIL MODE
;; (require 'evil)
;; (evil-mode t)
;; (setq
;;  ;; projectile project search
;;  projectile-project-search-path '("~/projects/")
;;  )
;; ;; save on focus loss
;; (defadvice switch-to-buffer (before save-buffer-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice other-window (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))
;; ;; Package Specific
;; ;; tide config
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; ;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

;; ;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; ;;Web more setup
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; ;; use spaces insitead of tabs
;; (setq-default
;;  ;; indentation
;;  indent-tabs-mode nil
;;  tab-width 2
;;  indent-line-function 'insert-tab
;;  web-mode-markup-indent-offset 2
;;  web-mode-css-indent-offset 2
;;  web-mode-code-indent-offset 2
;;  web-mode-enable-auto-pairing t
;;  web-mode-enable-css-colorization t
;;  web-mode-enable-comment-interpolation t
;;  web-mode-enable-current-element-highlight t
;;  web-mode-enable-current-column-highlight t
;;  typescript-indent-level 2
;;  css-indent-offset 2
;;  )
;; (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "red")
;; ;; multiple cursors
;; (global-evil-mc-mode 1)
;; (require 'multiple-cursors)
;; ;; enable Evil-Vimish-Fold
;; (require 'evil-vimish-fold)
;; (evil-vimish-fold-mode 1)
;; ;; collapse fringes
;; (fringe-mode 1)
;; ;; matching parens
;; (setq show-paren-delay 0)
;; (set-face-attribute 'show-paren-match nil :weight 'extra-bold) ;; make highlight extra bold
;; (set-face-foreground 'show-paren-match "#f00") ;; set highlight color to red
;; (set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors
;; ;; enable global surround
;; (global-evil-surround-mode t)
;; (global-evil-mc-mode t)
