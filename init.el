(add-to-list 'load-path "~/.emacs.d/packages/external/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))

(add-to-list 'load-path "~/.emacs.d/packages/installed/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/packages/installed/auto-complete/ac-dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/packages/zencoding")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet/snippets")

(load-file "~/.emacs.d/custom.el")

;; Remove the menu and tool bar's
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
