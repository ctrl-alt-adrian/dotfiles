;; >>>>>>> General Settings <<<<<< ;;

  ;; enable multiple-cursors
  (global-evil-mc-mode 1)
  (require 'multiple-cursors)

  ;; collapse fringes
  (fringe-mode 1)
  ;; Show line numbers dynamically with spaces on either side
  (defadvice linum-update-window (around linum-dynamic activate)
    (let* ((w (length (number-to-string
                       (count-lines (point-min) (point-max)))))
           (linum-format (concat " %" (number-to-string w) "d ")))
      ad-do-it))
  ;; Disable autosave
  (setq auto-save-default nil)
  ;; Matching Parens
  (show-paren-mode 1)
  (setq show-paren-delay -10) ;; make highlight instant
  (set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors

  ;; Whitespace-mode
  (setq whitespace-style '(trailing space tab-mark line indention column hspace tab))
  (autoload 'whitespace-toggle-options "whitespace" "Toggle local 'whitespace-mode' options." t)
  ;; Autocomplete
  (require 'auto-complete)
  (global-auto-complete-mode t)
  ;; Visable bell
  (setq visible-bell t)
  ;; drag stuff enable
  (drag-stuff-global-mode 1)
  ;; Use tab to indent or complete
  (setq tab-always-indent 'complete)

