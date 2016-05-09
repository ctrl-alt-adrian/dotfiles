;; >>>>>>> Org Config <<<<<<< ;;

;;org-todo-keywords
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED")))
(setq org-todo-keyword-faces
      '(("TODO" . "violet")
        ("IN-PROGRESS" . "yellow")
        ("WAITING" . "orange")
        ("|" . "aqua")
        ("CANCELED" . "red")
        ("DONE" . "green")
        ))
;; set path for agenda files
(setq org=agenda-files '("~/org/agenda"))
;; open agenda in current frame
(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT?"
  (interactive "P")
  (org-agenda-list)
  (when(not split)
    (delete-other-windows)))
;; capture template
(setq org-capture-templates
      '(("a" "my TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t")))
;; set capture once
(defun air-org-task-capture ()
  "Capture a task with my default template?"
  (interactive)
  (org-capture nil "a"))

;; >>>>>>> Agenda Tweaks <<<<<<< ;;

;; include archives when searching
(setq org-agenda-text-search-extra-fiels '(agenda-archives))
;; leave blank line at the end of the content of each task
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
;; mark all child task 'Done' before marking parent as Done
(setq org-enforce-todo-dependencies t)
;; know when task has changed status
(setq org-log-done (quote time))
;; insert annotation when I change deadline on tasks
(setq org-log-redeadline (quote time))
;; insert annotation when i reschedule
(setq org-log-reschedule (quote time))
