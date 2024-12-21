(add-to-list 'load-path "~/.emacs.d/my/evil")
(add-to-list 'load-path "~/.emacs.d/my/lsp")
(add-to-list 'load-path "~/.emacs.d/my/prog-modes")
(add-to-list 'load-path "~/.emacs.d/my/completion")

(require 'my-evil)
(require 'my-lsp)
(require 'my-prog-modes)
(require 'my-completion)

(provide 'my-editor)
