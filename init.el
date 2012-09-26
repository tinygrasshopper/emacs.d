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
		      ;; yasnippets-rails TODO
		      zencoding-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
