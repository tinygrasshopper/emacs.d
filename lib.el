(defun load-package (package-name)
  "loads a package from conf-packages"
  (load-file (concat "~/.emacs.d/conf-packages/" package-name ".el"))
)
