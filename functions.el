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

;; function for transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(85 85))
    (set-frame-parameter nil 'alpha '(85 50))))

