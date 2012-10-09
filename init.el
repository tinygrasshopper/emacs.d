(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refesh-contents))

(defvar my-packages '(js2-mode
		      ruby-mode
		      feature-mode
		      ghc
		      ;; egg
		      ;; html-mode
		      ;; one-key
		      php-mode
		      ;; rhtml TODO
		      ;; rinari TODO
		      ;; ruby-test-mode TODO
		      rvm
		      sass-mode
		      wrap-region
		      yasnippet
		      color-theme
		      ;; yasnippets-rails TODO
		      zencoding-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; (require 'ido)
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

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/key-bindings.el")
