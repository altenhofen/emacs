(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.org/packages/"))
(package-initialize)
(eval-when-compile
  (require 'use-package))
;; settings
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(set-face-attribute 'default nil :font "Iosevka Comfy  Motion" :height 160)

(add-to-list 'load-path "~/.emacs.d/my")

(require 'my-editor)
(require 'my-core)
(require 'my-qol)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult marginalia orderless vertico eat ef-themes flycheck-inline quick-peek company-pcomplete company lua-mode lsp-pyright lsp-ui-doc lsp-mode yasnippet evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
