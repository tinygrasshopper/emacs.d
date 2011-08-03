(load-file "~/.emacs.d/lib.el")

;; Comment out packages that are not needed
(load-package "color-theme")
(load-package "auto-complete")
(load-package "zencoding")
(load-package "yasnippet")
(load-package "scala-mode")
(load-package "rvm")
(load-package "rhtml")
(load-package "rinari")
;; (load-package "one-key")
(load-package "cucumber")
(load-package "ruby-test-mode")
(load-package "wrap-region")
(load-package "egg")
(load-package "haml-mode")

;; Snippet Directory
(setq yas/my-directory '("~/.emacs.d/packages/yasnippet/snippets" "~/.emacs.d/packages/cucumber/snippets" "~/.emacs.d/packages/yasnippets-rails/rails-snippets"))

;;(yas/load-directory yas/my-directory)
(mapc 'yas/load-directory yas/my-directory)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Remove the menu and tool bar's
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Enable copy to X-clipboard
(setq x-select-enable-clipboard t)

;; Questions as y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; syntax highlighting by default
(global-font-lock-mode 1)

;; match braces
(show-paren-mode 1)

;; remove splash
(setq inhibit-splash-screen t)

;; Remove the comment about encoding in ruby mode
(setq ruby-insert-encoding-magic-comment nil)

(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/key-bindings.el")
