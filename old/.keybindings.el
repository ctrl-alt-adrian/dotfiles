;; KEYBINDINGS!!!!

;;========== Neotree toggle =========;;
(global-set-key [f8] 'neotree-toggle)
;;========== multiple-cursors =======;;
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;========== ace jump mode ==========;;
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; ========== org mode ==============;;
;; call "org-adgenda"
(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)
;; call "org-capture"
(define-key global-map (kbd "C-c c") 'air-org-task-capture)
;; ========== vimish fold ============;;
;;(global-set-key (kbd "z-g") 'vimish-fold-toggle)
;; ========== fullscreen toggle ==========;;
(global-set-key [f9] 'fullscreen)
