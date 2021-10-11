;;; customConfig/ui.el -*- lexical-binding: t; -*-
;; set default frame size
(if (display-graphic-p)
    (progn
      (pushnew! initial-frame-alist
                '(width . 200)
                '(height . 57))
      (pushnew! default-frame-alist
                '(width . 200)
                '(height . 57))))
