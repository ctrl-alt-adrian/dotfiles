;;; customConfig/web.el -*- lexical-binding: t; -*-

;; web mode
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


;; vue mode config
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
