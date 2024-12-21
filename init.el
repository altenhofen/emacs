(eval-when-compile
  (require 'use-package))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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
   '(company-pcomplete company yasnippet lsp-ui lsp-mode lua-mode general-mode general.el general evil ef-themes eat)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
