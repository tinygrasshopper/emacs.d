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


(add-to-list 'load-path "~/.emacs.d/packages/scala-mode")
(require 'scala-mode-auto)

(setq yas/my-directory '("~/.emacs.d/packages/yasnippet/snippets"))
;;(yas/load-directory yas/my-directory)
(mapc 'yas/load-directory yas/root-directory)

(load-file "~/.emacs.d/custom.el")


(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Remove the menu and tool bar's
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Questions as y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; syntax highlighting by default
(global-font-lock-mode 1)
