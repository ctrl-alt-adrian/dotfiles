;;; tumble-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "tumble" "tumble.el" (22050 24808 0 0))
;;; Generated autoloads from tumble.el

(autoload 'tumble-text-from-region "tumble" "\
Post the current region as a text in Tumblr

\(fn MIN MAX TITLE STATE)" t nil)

(autoload 'tumble-text-from-buffer "tumble" "\
Post the current buffer as a text in Tumblr

\(fn TITLE STATE)" t nil)

(autoload 'tumble-quote-from-region "tumble" "\
Post a region as a quote in Tumblr

\(fn MIN MAX SOURCE STATE)" t nil)

(autoload 'tumble-link-with-description "tumble" "\
Posts a Tumblr link using the region as the description

\(fn MIN MAX NAME URL STATE)" t nil)

(autoload 'tumble-link "tumble" "\
Posts a Tumblr link without description

\(fn NAME URL STATE)" t nil)

(autoload 'tumble-chat-from-region "tumble" "\
Posts a chat to Tumblr using the current region

\(fn MIN MAX TITLE STATE)" t nil)

(autoload 'tumble-chat-from-buffer "tumble" "\
Posts a chat to Tumblr using the current buffer

\(fn TITLE STATE)" t nil)

(autoload 'tumble-photo-from-url "tumble" "\
Posts a photo to Tumblr using an URL as the source

\(fn SOURCE CAPTION URL STATE)" t nil)

(autoload 'tumble-photo-from-file "tumble" "\
Posts a local photo to Tumblr

\(fn FILENAME CAPTION URL STATE)" t nil)

(autoload 'tumble-audio "tumble" "\
Posts an audio file to Tumblr

\(fn FILENAME CAPTION STATE)" t nil)

(autoload 'tumble-video-from-url "tumble" "\
Uses EMBED to post a video to Tumblr

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; tumble-autoloads.el ends here
