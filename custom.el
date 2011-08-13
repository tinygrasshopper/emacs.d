(setq tab-width 2)

;; Get rid of the annoying 4 space default for sh mode
(defun setup-sh-mode ()
  (setq sh-basic-offset 2
        sh-indentation 2
	sh-indent-for-case-label 0
        sh-indent-for-case-alt '+)
)
(add-hook 'sh-mode-hook 'setup-sh-mode)


(color-theme-dark-laptop)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set file name in title
(setq frame-title-format "%f - emacs")

;; Font size to 9
(set-face-attribute 'default nil :height 90)


(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
