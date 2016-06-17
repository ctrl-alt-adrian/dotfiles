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
(set-face-attribute 'show-paren-match nil :weight 'extra-bold) ;; make highlight extra bold
(set-face-foreground 'show-paren-match "#f00") ;; set highlight color to red
(set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors
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
;; fullscreen mode
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
;; ^^ f9 is the hotkey to toggle fullscreen per the .keybindings file
;; change font style when comments are toggled
;;(setq font-lock-comment-face "Operator Mono Medium Italic")

;;>>>>>>>>>>><<<<<<<<<<<<<;;

;; UTF-8 EVERYWHERE!
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
