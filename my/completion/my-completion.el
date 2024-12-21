(use-package company
  :ensure t
  :custom
  (company-idle-delay 0)
  (company-frontends '(company-pseudo-tooltip-frontend))
  :config
  (define-key company-active-map (kbd "<f12>") 'company-abort)
  (define-key company-active-map (kbd "<tab>") (lambda () (interactive) (company-complete-common) (company-select-next)))
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  (global-company-mode))

(use-package company-pcomplete :after company
  :ensure t
  :custom
  (pcomplete-expand-before-complete nil)
  (pcomplete-cycle-completions nil))

(provide 'my-completion)
