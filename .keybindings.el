;; KEYBINDINGS!!!!

;;======== Neotree ========;;
(global-set-key [f8] 'neotree-toggle)
;;======== multiple-cursors ========;;
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; ========== Org Mode ===========;;
;; key binding to bring up agenda list
(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)
;; Close capture key binding
(define-key global-map (kbd "C-c c") 'air-org-task-capture)
