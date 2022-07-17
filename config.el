(use-package request
  :ensure t)

(use-package lsp-mode
  :defer t
  :ensure t)

(use-package lsp-ui
    :after lsp
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq lsp-ui-sideline-enable t)
    (setq lsp-ui-sideline-show-hover nil)
    (setq lsp-ui-doc-position 'bottom)
    (lsp-ui-doc-show))

(use-package fsharp-mode
  :defer t
  :ensure t)

(use-package eglot-fsharp
  :ensure t)

(use-package company
  :ensure t)

(use-package company-quickhelp
   :ensure t
   :config
   (company-quickhelp-mode nil)
   :hook
   ((emacs-lisp-mode . (lambda () (company-mode)))
    ((fsharp-mode . (lambda () (company-mode))))))

(use-package monokai-pro-theme 
  :ensure t
  :load-path "themes"
  :config
  (load-theme 'monokai-pro-octagon t)
  )

(use-package 
  :ensure t)
