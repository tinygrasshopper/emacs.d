(add-to-list 'load-path "~/.emacs.d/packages/external/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))

(load-file "~/.emacs.d/custom.el")

