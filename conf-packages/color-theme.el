(add-to-list 'load-path "~/.emacs.d/packages/color-theme")
(require 'color-theme)
(eval-after-load "color-theme" '(progn (color-theme-initialize)))
