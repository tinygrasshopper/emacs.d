(windmove-default-keybindings) ;; Shift + Arrow keys for moving across windows

(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)

(global-set-key (kbd "C-/") 'comment-uncomment-line-or-region)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)