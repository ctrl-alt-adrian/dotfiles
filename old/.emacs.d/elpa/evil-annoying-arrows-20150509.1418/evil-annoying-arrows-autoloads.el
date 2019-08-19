;;; evil-annoying-arrows-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "evil-annoying-arrows" "evil-annoying-arrows.el"
;;;;;;  (22050 24942 0 0))
;;; Generated autoloads from evil-annoying-arrows.el

(autoload 'evil-annoying-arrows-mode "evil-annoying-arrows" "\
Evil-Annoying-Arrows emacs minor mode.

\(fn &optional ARG)" t nil)

(defvar global-evil-annoying-arrows-mode nil "\
Non-nil if Global-Evil-Annoying-Arrows mode is enabled.
See the command `global-evil-annoying-arrows-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-annoying-arrows-mode'.")

(custom-autoload 'global-evil-annoying-arrows-mode "evil-annoying-arrows" nil)

(autoload 'global-evil-annoying-arrows-mode "evil-annoying-arrows" "\
Toggle Evil-Annoying-Arrows mode in all buffers.
With prefix ARG, enable Global-Evil-Annoying-Arrows mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Annoying-Arrows mode is enabled in all buffers where
`evil-annoying-arrows-mode' would do it.
See `evil-annoying-arrows-mode' for more information on Evil-Annoying-Arrows mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-annoying-arrows-autoloads.el ends here
