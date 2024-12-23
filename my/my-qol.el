(require 'use-package)

(setq frame-resize-pixelwise 1)
(setq warning-minimum-level :emergency)
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package vertico
  :ensure t)
(vertico-mode 1)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode))
(use-package consult
  :ensure t)

(provide 'my-qol)
