;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; set theme
(setq doom-theme 'doom-molokai)
;; set titlebar to transparent
(setq ns-auto-titlebar-mode t)
;; auto-hide title bar
;; (setq ns-auto-hide-menu-bar t)
;; set font
(setq
 doom-font (font-spec :family "Source Code Pro" :size 15)
 doom-big-font (font-spec :family "Source Code Pro" :size 40)
 )
;; set widnow size to fullscreen upon load
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; visable bell
(setq visible-bell t)
;; highlight indent guides
(setq highlight-indent-guides-method 'character)
