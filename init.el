(setq tab-width 2)

;; Get rid of the annoying 4 space default for sh mode
(defun setup-sh-mode ()
  (setq sh-basic-offset 2
        sh-indentation 2
	sh-indent-for-case-label 0
        sh-indent-for-case-alt '+)
)
(add-hook 'sh-mode-hook 'setup-sh-mode)