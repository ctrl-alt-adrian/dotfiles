;; >>>>>>> General Settings <<<<<< ;;

 ;; set powerline separator
 (setq powerline-default-separator 'slant)
 ;; set spaceline theme
 (spaceline-spacemacs-theme)
 ;; enable multiple-cursors
 (global-evil-mc-mode 1)
 (require 'multiple-cursors)
 ;; enable Evil-Vimish-Fold
 (require 'evil-vimish-fold)
 (evil-vimish-fold-mode 1)
 ;; collapse fringes
 (fringe-mode 1)
 ;; show line numbers dynamically with spaces on either side
 (defadvice linum-update-window (around linum-dynamic activate)
   (let* ((w (length (number-to-string
                      (count-lines (point-min) (point-max)))))
          (linum-format (concat " %" (number-to-string w) "d ")))
     ad-do-it))
 ;; disable auto-save
 (setq auto-save-default nil)
 ;; matching Parens
 (show-paren-mode 1)
 (setq show-paren-delay -10) ;; make highlight instant
 (set-face-background 'show-paren-match (face-background 'default)) ;; disable face background to default colors

 ;; whitespace-mode
 (setq whitespace-style '(trailing space tab-mark line indention column hspace tab))
 (autoload 'whitespace-toggle-options "whitespace" "Toggle local 'whitespace-mode' options." t)
 ;; auto-complete
 (require 'auto-complete)
 (global-auto-complete-mode t)
 ;; visable bell
 (setq visible-bell t)
 ;; drag stuff enable
 (drag-stuff-global-mode 1)
 ;; use tab to indent or complete
 (setq tab-always-indent 'complete)
