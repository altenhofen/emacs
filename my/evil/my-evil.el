(use-package evil
  :ensure t)
(evil-mode 1)

(evil-set-initial-state 'eat-mode 'emacs)
;;; Leader
(define-prefix-command 'my-leader-map)

(keymap-set evil-motion-state-map "SPC" 'my-leader-map)
(keymap-set evil-normal-state-map "SPC" 'my-leader-map)
(keymap-set evil-normal-state-map "SPC SPC" 'find-file)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(evil-define-key nil my-leader-map
    ;; add your bindings here:
    "b" 'switch-to-buffer
    "ff" 'find-file
    ;; etc.
    )
(provide 'my-evil)
