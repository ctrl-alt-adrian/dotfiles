;;; customConfig/treemacs.el -*- lexical-binding: t; -*-

;; toggle treemacs
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Open Treemacs"
       "t" #'treemacs))
