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


;; Font size to 9
(set-face-attribute 'default nil :height 90)


;; Shift + Arrow keys for moving across windows
(windmove-default-keybindings)


(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

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

