(require 'use-package)
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

(use-package flycheck
  :custom
  (flycheck-display-errors-function (lambda (errors) (ignore errors) nil))
  (eldoc-idle-delay 0.0)
  (flycheck-display-errors-delay 0.1)
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-check-syntax-automatically '(save mode-enabled))
  :config
  (setf (cdr flycheck-mode-map) nil)
  (global-flycheck-mode))

(use-package quick-peek
  :ensure t)

(use-package flycheck-inline
  :ensure t
  :config
  (setq flycheck-inline-display-function
        (lambda (msg &optional pos err)
          (ignore err)
          (set-text-properties 0 (length msg) nil msg)
          (let* ((ov (quick-peek-overlay-ensure-at pos))
                 (contents (quick-peek-overlay-contents ov)))
            (setf (quick-peek-overlay-contents ov)
                  (concat contents (when contents "\n") msg))
            (quick-peek-update ov)))
        flycheck-inline-clear-function #'quick-peek-hide)
  (global-flycheck-inline-mode))

(use-package flymake
  :ensure t
  :config
  (defun flymake-eldoc-function (report-doc &rest _)
    "Document diagnostics at point.
Intended for `eldoc-documentation-functions' (which see)."
    (let ((diags (flymake-diagnostics (point))))
      (when diags
        (funcall report-doc
                 (mapconcat #'flymake-diagnostic-text diags "\n")
                 :sort 'error)))))

(use-package eldoc
  :custom
  (eldoc-idle-delay 0.1)
  (eldoc-echo-area-prefer-doc-buffer t)
  :config
  (defun my/eldoc-display-quick-peek (docs interactive)
    "Display DOCS in a `quick-peek' popup."
    (when docs
      (--each docs
        (if (eq (plist-get (cdr it) :sort) 'error)
            (let ((msg
                   (with-current-buffer (eldoc--format-doc-buffer (list it))
                     (buffer-string))))
              (quick-peek-show (format "%s" msg)))
          (eldoc-display-in-echo-area (list it) interactive)))))
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose)
  (setq eldoc-display-functions '(eldoc-display-in-echo-area eldoc-display-in-buffer)))

(provide 'my-completion)
