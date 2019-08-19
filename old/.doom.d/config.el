;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Load Settings Files
(load-file "~/.doom.d/keybindings.el")
(load-file "~/.doom.d/orgconfig.el")

;; General
;; EVIL MODE
(require 'evil)
(evil-mode t)
(setq
 ;; set font
 doom-font (font-spec :family "Source Code Pro" :size 15)
 ;; projectile project search
 projectile-project-search-path '("~/projects/")
 )
;; set widnow size to fullscreen upon load
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; save on focus loss
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
;; Package Specific
;; tide config
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;;Web more setup
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; use spaces insitead of tabs
(setq-default
 ;; indentation
 indent-tabs-mode nil
 tab-width 2
 indent-line-function 'insert-tab
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-enable-auto-pairing t
 web-mode-enable-css-colorization t
 web-mode-enable-comment-interpolation t
 web-mode-enable-current-element-highlight t
 web-mode-enable-current-column-highlight t
 typescript-indent-level 2
 css-indent-offset 2
 )
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "red")
;; multiple cursors
(global-evil-mc-mode 1)
(require 'multiple-cursors)
;; enable Evil-Vimish-Fold
(require 'evil-vimish-fold)
(evil-vimish-fold-mode 1)
;; collapse fringes
(fringe-mode 1)
;; matching parens
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match nil :weight 'extra-bold) ;; make highlight extra bold
(set-face-foreground 'show-paren-match "#f00") ;; set highlight color to red
(set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors
;; visable bell
(setq visible-bell t)
;; enable global surround
(global-evil-surround-mode t)
(global-evil-mc-mode t)
