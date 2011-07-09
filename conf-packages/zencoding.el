(add-to-list 'load-path "~/.emacs.d/packages/zencoding")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
