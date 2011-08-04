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


;; Shift + Arrow keys for moving across windows
(windmove-default-keybindings)



(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
        (exchange-point-and-mark))
     (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
       (forward-line -1)))))
(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))
(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))
(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)


(defun comment-uncomment-line-or-region (&optional arg)
  "comments or uncomments a line according to state before.
With key pressed, continues with next line.
With arg copies and reinserts last line."
  (interactive "*P")
  (comment-normalize-vars)
  (let* ((arg (if arg (prefix-numeric-value arg) 0))
         (start (if (and mark-active transient-mark-mode)
                    (region-beginning)
                  (line-beginning-position)))
         (end (if (and mark-active transient-mark-mode)
                  (region-end)
                (line-end-position)))
         (line-to-comment-or-uncomment (buffer-substring-no-properties
                                        (or
                                         start (line-beginning-position))
                                        (or end
                                            (line-end-position)))))
    (cond ((eq 1 arg) ;; comment and reinsert
           (comment-or-uncomment-region start end)
           (indent-according-to-mode)
           (end-of-line)
           (newline)
           (insert line-to-comment-or-uncomment)
           (indent-according-to-mode))
          ((< 1 arg) ;; comment as many lines are given
           (while (<= 1 (prefix-numeric-value arg))
             (comment-or-uncomment-region (line-beginning-position)
(line-end-position))
             (indent-according-to-mode)
             (end-of-line)
             (forward-line 1)
             ;; (indent-according-to-mode)
             (setq arg (1- arg))))
          ((and start end)
           (comment-or-uncomment-region start end)
           (indent-according-to-mode)
           (if (eobp)
               (progn (newline)
                      (indent-according-to-mode))
             (progn
               (forward-line 1)
               (indent-according-to-mode))))
          (t ;; just one line
           (progn (comment-or-uncomment-region (line-beginning-position)
(line-end-position))
                  (indent-according-to-mode)
                  (if (eobp)
                      (progn (newline)
                             (indent-according-to-mode))
                    (progn
                      (forward-line 1)
                      (indent-according-to-mode))))))))

(provide 'comment-uncomment-line-or-region)
;;; comment-uncomment-line-or-region.el ends here

(global-set-key (kbd "C-/") 'comment-uncomment-line-or-region)

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
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)