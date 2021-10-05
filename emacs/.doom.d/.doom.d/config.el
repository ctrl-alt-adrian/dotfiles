;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Adrian Thomas"
      user-mail-address "adrian.l.thomas@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrainsMono NF" :size 15 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-spectrum)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (load! "~/.doom.d/polymodeconfig.el")
;;
;; disable line numbers for certain things
(dolist (mode '(org-mode-hook
                term-mode-hook
                vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; disable persistent undo history
(after! undo-tree
  (setq undo-tree-auto-save-history nil))

;; toggle treemacs
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Open Treemacs"
       "t" #'treemacs))

;; lsp
(use-package lsp-mode
  :commands lsp)

;; vue mode config
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; start lsp with webmode && vue-mode
;; (add-hook 'web-mode-hook #'lsp!)
;; (add-hook 'vue-mode-hook #'lsp!)

;; treesitter config
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; set project directories in projectile
(setq projectile-project-search-path '("~/projects/" "~/work/"))

;; set default frame size
(if (display-graphic-p)
    (progn
      (pushnew! initial-frame-alist
                '(width . 200)
                '(height . 57))
      (pushnew! default-frame-alist
                '(width . 200)
                '(height . 57))))

(use-package web-mode
  :ensure t
  :mode (("\\.html\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.vue\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-intent-offset 2)
  (setq web-mode-code-intent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-css-colorization t)
;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
;; (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")
(setq web-mode-content-type-alias
      '(("vue" . "\\.vue\\'")))
(use-package company-web
  :ensure t)
(add-hook 'web-mode-hook (lambda()
                           (cond ((equal web-mode-content-type "html")
                                  (my/web-html-setup)))
                           (cond ((equal web-mode-content-type "vue")
                                  (my/web-vue-setup)))
                           ))
)

;;
;; html
;;
(defun my/web-html-setup()
  "Setup for web-mode html files."
  (message "web-mode use html related setup")
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-select-checker 'html-tidy)
  (add-to-list (make-local-variable 'company-backends)
               '(company-web-html company-files company-css company-capf company-dabbrev))
  ;; (add-hook 'before-save-hook #'sgml-pretty-print)
  )

;;
;; vue
;;
(defun my/web-vue-setup()
  "Setup for web-mode vue files."
  (message "web-mode use vue related setup")
  (setup-tide-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (my/use-eslint-from-node-modules)
  (flycheck-select-checker 'javascript-eslint)
  (add-to-list (make-local-variable 'company-backends)
               '(company-tide company-web-html compoany-files company-css))
  )

;;
;; eslint use local
;;
(defun my/use-eslint-from-node-modules()
  "Use local eslint from node_modules before global"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node-modules"))
         (eslint (and root(
                           expeand-file-name "node_modules/eslint/bin/esling.js"
                                             root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint)))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
)
