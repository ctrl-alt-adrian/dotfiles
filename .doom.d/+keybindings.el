;;; -*- lexical-binding: t; -*-

;; treemacs toggle
;; (global-set-key (kbd "s-\\") '+treemacs/toggle)
(map! :g "s-\\" '+treemacs/toggle)
;; multiple cursors
(map! :g "C-S-c C-S-c" 'mc/edit-lines)
(map! :g "C->" 'mc/mark-next-like-this)
(map! :g "C-<" 'mc/mark-previous-like-this)
(map! :g "C-c C-<" 'mc/mark-all-like-this)
;; autosave
(add-hook! '(doom-switch-window-hook
             doom-switch-buffer-hook
             focus-out-hook) ; frames
           (save-some-buffers t))
