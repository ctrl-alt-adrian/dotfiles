;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     c-c++
     colors
     dash
     deft
     django
     eyebrowse
     emacs-lisp
     emoji
     evil-commentary
     floobits
     games
     git
     github
     haskell
     html
     javascript
     lua
     markdown
     org
     osx
     php
     python
     ruby
     ruby-on-rails
     (shell :variables
            shell-default-term-shell "/bin/zsh"
            shell-default-shell 'multi-term
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     spotify
     syntax-checking
     swift
     themes-megapack
     version-control
     windows-scripts
     yaml
     ;; end config
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ace-jump-mode
                                      chess
                                      drag-stuff
                                      dropbox
                                      evil-rails
                                      hlinum
                                      multiple-cursors
                                      org-caldav
                                      org-cliplink
                                      org-dashboard
                                      org-dotemacs
                                      org-jekyll
                                      org-journal
                                      org-mac-iCal
                                      org-octopress
                                      org-pdfview
                                      org-trello
                                      origami
                                      octopress
                                      osx-dictionary
                                      paredit
                                      smart-tabs-mode
                                      ssh
                                      sunshine
                                      thesaurus
                                      ztree
                                      ;; end config
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spolsky
                         brin
                         solarized-dark
                         ;;end config
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 14
                               ;;:size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'prog-mode
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; begin config

  ;; Keybindings file
  (load-file "~/git/dotfiles/.keybindings.el")
  ;; Set Powerline seperator
  (setq powerline-default-separator 'slant)

;; =============================================================== ;;

  ;; enable multiple-cursors
  (global-evil-mc-mode 1)
  (require 'multiple-cursors)
  ;; activate hlinum
  (hlinum-activate)
  ;; collapse fringes
  (fringe-mode 1)
  ;; Show line numbers dynamically with spaces on either side
  (global-linum-mode 1)
  (defadvice linum-update-window (around linum-dynamic activate)
    (let* ((w (length (number-to-string
                       (count-lines (point-min) (point-max)))))
           (linum-format (concat " %" (number-to-string w) "d ")))
      ad-do-it))
  ;; Disable autosave
  (setq auto-save-default nil)
  ;; Matching Parens
  (show-paren-mode 1)
  (setq show-paren-delay -10) ;; make highlight instant
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold) ;; make highlight extra bold
  (set-face-foreground 'show-paren-match "#f00") ;; set highlight color to red
  (set-face-background 'show-paren-match (face-background 'default)) ;; Disable face background to default colors
  ;; shell
  ;;(setq explicit-shell-file-name "c:/msys64/usr/bin/mintty.exe")
  ;;(setq shell-file-name "bash")
  ;;(setenv "SHELL" shell-file-name)
  ;; Whitespace-mode
  (setq whitespace-style '(trailing space tab-mark line indention column hspace tab))
  (autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
  ;; Autocomplete
  (require 'auto-complete)
  (global-auto-complete-mode t)
  ;; Visable bell
  (setq visible-bell t)
  ;; drag stuff enable
  (drag-stuff-global-mode 1)
  ;;===================================== org =================================================;;

  ;; org-todo-keywords
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-todo-keyword-faces
        '(("TODO" . "violet")
          ("IN-PROGRESS" . "yellow")
          ("WAITING" . "orange")
          ("|" . "aqua")
          ("CANCELED" . "red")
          ("DONE" . "green")
          ))
  ;; set path for agenda files
  (setq org-agenda-files '("h:/org/"))
  ;; open agenda in current frame
  (defun air-pop-to-org-agenda (split)
    "Visit the org agenda, in the current window or a SPLIT."
    (interactive "P")
    (org-agenda-list)
    (when(not split)
      (delete-other-windows)))
  ;; capture template
  (setq org-capture-templates
        '(("a" "My TODO task format." entry
           (file "todo.org")
           "* TODO %?
SCHEDULED: %t")))
  ;; set capture once
  (defun air-org-task-capture ()
    "Capture a task with my default template."
    (interactive)
    (org-capture nil "a"))
  ;;=============== AGENDA TWEAKS ===================;;
  ;; include archives when searching
  (setq org-agenda-text-search-extra-files '(agenda-archives))
  ;; leave blank line at the end the content of each task
  (setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
  ;; Mark all child task 'Done' before marking parent as Done
  (setq org-enforce-todo-dependencies t)
  ;; Know when tasks has changed status
  (setq org-log-done (quote time))
  ;; Insert annotation when I change deadline on tasks
  (setq org-log-redeadline (quote time))
  ;; Insert annotion when I reschedule
  (setq org-log-reschedule (quote time))
  ;; =============== ASPELL ================;;
  ;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  ;; where the custom dictionary is
  (setq ispell-program-name "aspell")
  ;;(setq ispell-personal-dictionary "C:/")

  ;; Disable exe-path-from-shell message
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize)

  ;; end config
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
