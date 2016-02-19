;;; smart-window-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "smart-window" "smart-window.el" (22050 24863
;;;;;;  0 0))
;;; Generated autoloads from smart-window.el

(autoload 'smart-window-move "smart-window" "\
Move the current window to the edge of the frame. The edge
options are 'left/right/above/below', where 'below' is the default.

For example, if you chose 'above', then the current window
would be at the very top, using the full width of the screen.

\(fn EDGE)" t nil)

(autoload 'smart-window-buffer-split "smart-window" "\
Split the current window, where new window content is not current
buffer but the buffer you picked from the minibuffer prompt.

\(fn BUFFER-NAME)" t nil)

(autoload 'smart-window-file-split "smart-window" "\
Split the current window, where new window content is not current
buffer but the file you picked form the minibuffer prompt.

\(fn FILE-NAME)" t nil)

(autoload 'sw-below "smart-window" "\
Split current window with new window at below. The new window
content is the buffer you picked from the minibuffer prompt.

\(fn BUFFER-NAME)" t nil)

(autoload 'sw-above "smart-window" "\
Split current window with new window at above. The new window
content is the buffer you picked from the minibuffer prompt.

\(fn BUFFER-NAME)" t nil)

(autoload 'sw-left "smart-window" "\
Split current window with new window left to the current one.
The new window content is the buffer you picked from the minibuffer prompt.

\(fn BUFFER-NAME)" t nil)

(autoload 'sw-right "smart-window" "\
Split current window with new window right next to current one.
The new window content is the buffer you picked from the minibuffer prompt.

\(fn BUFFER-NAME)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; smart-window-autoloads.el ends here
