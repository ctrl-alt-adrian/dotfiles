; start EMACS
;; Packages
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; EVIL MODE
(require 'evil)
(evil-mode t)
;; Use EVIL surround in all buffers
(global-evil-surround-mode 1)

;; EVIL REBELLION!!!
(add-to-list 'load-path "~/.emacs.d/packages/evil-rebellion")
(require 'evil-rebellion)

;; Size of window
;;(add-to-list 'initial-frame-alist '(height . 138))
;;(add-to-list 'initial-frame-alist '(width . 55))
(x-display-pixel-width)
(x-display-pixel-height)

;; Essentials
(setq-default indent-tabs-mode nil)
(setq large-file-warning-threshold nil)
(setq visible-bell t)
(blink-cursor-mode 1) ;; Disable blinking cursor
(setq-default cursor-type '(bar .1)) ;; Change cursor type

;; Powerline
(add-to-list 'load-path "~/.emacs.d/packages/powerline-evil")
(require 'powerline-evil)
(require 'cl)
(powerline-evil-vim-color-theme)

;; Line Numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Theme Directory
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'brin t)

;; Store backups elsewhere
(setq backup-directory-alist '(("." . "~/.emacs-backups")))

;; Highlight Current Line
(global-hl-line-mode +1)
;; Set HL color
(set-face-background 'hl-line "#252A30")
;; Keep syntax highlighting in current line
(set-face-foreground 'highlight nil)

;; Disable autosave
(setq auto-save-default nil)

;; Indent Guide
(add-to-list 'load-path "~/.emacs.d/packages/indent-guide")
(require 'indent-guide)

;; Highlight Indentation
(add-to-list 'load-path "~/.emacs.d/packages/Highlight-Indentation-for-Emacs")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#373737")

;; Keep syntax highlighting in current line
(set-face-foreground 'highlight nil)

;; Show Matching Parens
(require 'paren)
(show-paren-mode 1)
(setq show-paren-delay 0) ;; make highlight instant
(set-face-attribute 'show-paren-match nil :weight 'extra-bold) ;; make highlight extra bold
(set-face-foreground 'show-paren-match "#f00") ;; set highlight color to red
(set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors

;; Turn off splash screen
(setq inhibit-startup-message t)

;; Autopairs!!!!
(add-to-list 'load-path "~/.emacs.d/packages/autopair")
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffuzz!

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Multiple Cursors
(add-to-list 'load-path "~/.emacs.d/packages/multiple-cursors")
(require 'multiple-cursors)
;; multiple-cursors keybindings
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



















;; Configs set by the Emacs GUI!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f9e76e6cfba313cb577b4f8281724d21efc0dd0d3523a3c4326eaca080909cc8" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8df77ba4a960d91f16f0c8f9ee93984a4ab1f19c7c5f6a342547e8ee292b1cfc" default)))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Monaco for Powerline"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "green" :foreground "black"))))
 '(term-color-blue ((t (:background "DodgerBlue2" :foreground "DodgerBlue2"))))
 '(term-color-cyan ((t (:background "CadetBlue2" :foreground "CadetBlue2"))))
 '(term-color-green ((t (:background "LimeGreen" :foreground "LimeGreen")))))

;; sRGB doesn't blend with Powerline's pixmap colors, bot is only
;; used in OSX.  Disable sRGB before setting up Powerline.
(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

(provide 'emacs)
;; fin
