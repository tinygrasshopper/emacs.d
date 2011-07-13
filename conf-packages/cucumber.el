(add-to-list 'load-path "~/.emacs.d/packages/cucumber")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))
