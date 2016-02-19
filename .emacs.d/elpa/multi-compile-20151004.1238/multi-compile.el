;;; multi-compile.el --- Multi target interface to compile. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2015 Kvashnin Vladimir
;;
;; Author: Kvashnin Vladimir <reangd@gmail.com>
;; Created: 2015-10-01
;; Version: 0.1.0
;; Package-Version: 20151004.1238
;; Keywords: tools compile build
;; URL: https://github.com/ReanGD/emacs-multi-compile
;; Package-Requires: ((emacs "24"))
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
;;
;;; Commentary:
;; "Multi-compile" is multi target interface to "compile" command.
;;
;; Setup
;; ----
;; M-x package-install multi-compile
;;
;; Configure
;; ----
;; 
;; Sample config for Rustlang:
;;  ;;; init.el --- user init file
;;     (require 'multi-compile)
;;     (setq multi-compile-alist '(
;;         (rust-mode . (("rust-debug" . "cargo run")
;;                       ("rust-release" . "cargo run --release")
;;                       ("rust-test" . "cargo test")))
;;         ))
;;
;; In a compilation commands, you can use the templates:
;; - "%path" - "/tmp/prj/file.rs"
;; - "%dir" - "/tmp/prj/"
;; - "%file-name" - "file.rs"
;; - "%file-sans" - "file"
;; - "%file-ext" - "rs"
;; - "%make-dir" - (Look up the directory hierarchy from current file for a directory containing "Makefile") - "/tmp/"
;;
;; for example, add a make compilation (with a template "make-dir"):
;; (setq multi-compile-alist '(
;;     (c++-mode . (("cpp-run" . "make --no-print-directory -C %make-dir")))
;;     (rust-mode . (("rust-debug" . "cargo run")
;;                   ("rust-release" . "cargo run --release")
;;                   ("rust-test" . "cargo test")))
;;     ))
;;
;; You can use filename pattern:
;; (setq multi-compile-alist '(
;;     ("\\.txt\\'" . (("text-filename" . "echo %file-name")))
;;
;; You can use different backends for the menu:
;; (setq multi-compile-completion-system 'ido)
;; or
;; (setq multi-compile-completion-system 'helm)
;; or
;; (setq multi-compile-completion-system 'default)
;;
;; Usage
;; ----
;; - Open *.rs file
;; - M-x multi-compile-run
;;
;; For a detailed introduction see:
;; https://github.com/ReanGD/emacs-multi-compile/blob/master/README.md
;;
;;; Code:

(require 'compile)

(defgroup multi-compile nil
  "Multi target interface to `compile'."
  :link '(url-link "https://github.com/ReanGD/multi-compile")
  :prefix "multi-compile-"
  :group 'processes)

(defcustom multi-compile-alist
  '(
    (rust-mode . (("rust-debug" . "cargo run")
                  ("rust-release" . "cargo run --release")
                  ("rust-test" . "cargo test")))
    (c++-mode . (("cpp-run" . "make --no-print-directory -C %make-dir")))
    ("\\.txt\\'" . (("text-filename" . "echo %file-name")))
    )
  "Alist of filename patterns vs corresponding format control strings."
  :type '(repeat
          (cons
           (choice
            (regexp :tag "Filename pattern")
            (function :tag "Major-mode"))
           (repeat
            (cons
             (string :tag "Compilation name")
             (string :tag "Compilation command"))
            )))
  :group 'multi-compile)

(defcustom multi-compile-template
  '(
    ("%path" . (buffer-file-name))
    ("%dir" . (file-name-directory (buffer-file-name)))
    ("%file-name" . (file-name-nondirectory (buffer-file-name)))
    ("%file-sans" . (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
    ("%file-ext" . (file-name-extension (file-name-nondirectory (buffer-file-name))))
    ("%make-dir" . (locate-dominating-file (buffer-file-name) "Makefile"))
    )
  "Default expansion list."
  :type '(alist :key-type string :value-type sexp)
  :group 'multi-compile)

(defcustom multi-compile-completion-system 'ido
  "The completion system to be used by multi-compile."
  :type '(radio
          (const :tag "Ido" ido)
          (const :tag "Helm" helm)
          (const :tag "Default" default)
          (function :tag "Custom function"))
  :group 'multi-compile)


(defun multi-compile--apply-template (format-string)
  (dolist (template multi-compile-template)
    (while (string-match (car template) format-string)
      (let ((new-text (eval (cdr template))))
        (setq format-string
              (replace-match
               (if new-text new-text
                 (concat "not-found-" (substring (car template) 1)))
               t nil format-string)))))
  format-string)
(defun multi-compile--check-mode (mode-pattern filename)
  (or
   (and (symbolp mode-pattern)
        (eq mode-pattern major-mode))
   (and (stringp mode-pattern)
        (string-match mode-pattern filename))))

(defun multi-compile--choice-compile-command (compile-list)
  (let ((prompt "action: ")
        (choices (mapcar #'car compile-list)))
    (cdr
     (assoc
      (cond
       ((eq multi-compile-completion-system 'ido)
        (ido-completing-read prompt choices))
       ((eq multi-compile-completion-system 'default)
        (completing-read prompt choices))
       ((eq multi-compile-completion-system 'helm)
        (if (fboundp 'helm-comp-read)
            (helm-comp-read prompt choices
                            :candidates-in-buffer t
                            :must-match 'confirm)
          (user-error "Please install helm from https://github.com/emacs-helm/helm")))
       (t (funcall multi-compile-completion-system prompt choices)))
      compile-list))))

;;;###autoload
(defun multi-compile-run ()
  "Choice target and start compile."
  (interactive)
  (let ((filename (buffer-file-name))
        (is-not-call t))
    (if (not filename)
        (error "cannot get filename."))
    (dolist (mode-item multi-compile-alist)
      (when (and is-not-call
                 (multi-compile--check-mode (car mode-item) filename))
        (setq is-not-call nil)
        (compilation-start
         (multi-compile--apply-template
          (multi-compile--choice-compile-command (cdr mode-item))))))))

(provide 'multi-compile)

;;; multi-compile.el ends here
