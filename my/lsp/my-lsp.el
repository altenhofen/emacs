(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  :hook ((lsp-mode . yas-minor-mode)))

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-lens-enable nil)
  (lsp-prefer-flymake nil)
  (lsp-enable-snippet t)
  (lsp-eldoc-render-all t))

(defun my/lsp-setup ()

(setq-local my/contextual-lookup #'eldoc)
(setq-local eldoc-display-functions '(eldoc-display-in-buffer)))
(add-hook 'lsp-mode-hook #'my/lsp-setup)
(use-package lsp-ui
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-doc-delay 0)
  (lsp-ui-doc-use-childframe t)
  ;; (lsp-ui-doc-alignment 'frame)
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-position 'at-point)
  ;; (lsp-ui-doc-position 'top)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-flycheck-live-reporting nil)
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (ef-themes-with-colors
    (set-face-attribute 'lsp-ui-doc-background nil :background bg-main)))

(use-package lsp-ui-doc
  :ensure t)
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "basedpyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(add-hook 'lua-mode-hook 'lsp-mode)
(add-hook 'python-mode-hook 'lsp-mode)
(add-hook 'rust-mode-hook 'lsp-mode)
(add-hook 'go-mode-hook 'lsp-mode)
(add-hook 'c-mode-hook 'lsp-mode)
(add-hook 'c++-mode-hook 'lsp-mode)

(provide 'my-lsp)
