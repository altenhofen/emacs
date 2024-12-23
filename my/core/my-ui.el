(use-package ef-themes
  :ensure t)
;;(load-theme 'ef-deuteranopia-dark t)
(load-theme 'ef-light t)
(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

(provide 'my-ui)
