(use-package request
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (use-package flymake-flycheck
    :ensure t))

(use-package yasnippet
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'before-save-hook #'(lambda () (when (eq major-mode 'fsharp-mode)
					     (lsp-format-buffer))))
  :hook (lsp-mode . lsp-lens-mode)
  :config
  (use-package lsp-treemacs
    :ensure t))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-sideline-diagnostic-max-lines 7)
  (setq lsp-ui-sideline-diagnostic-max-line-length 30)
  (defun magueta/lsp-ui-doc-toggle ()
    "For some reason it is required to do at least once a call to lsp-ui-doc-show in order for this to work. Probably the problem resides on the frame created requiring some preparation before actually being used, so `frame-live-p` doesn't return nil."
    (interactive)
    (let ((frame (lsp-ui-doc--get-frame)))
      (if (frame-live-p frame)
	  (cond ((frame-visible-p frame) (lsp-ui-doc-hide))
		(t (lsp-ui-doc-show)))
	(message "Hover with the mouse or call `lsp-ui-doc-show` over some obect first. For why, read doc string."))))
  :bind
  (("s-?" . 'magueta/lsp-ui-doc-toggle)))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (clojure-mode . rainbow-delimiters-mode)
  (fsharp-mode . rainbow-delimiters-mode)
  (lisp-mode . rainbow-delimiters-mode)
  (emacs-lisp-mode . rainbow-delimiters-mode)
  (hy-mode . rainbow-delimiters-mode)
  (lfe-mode . rainbow-delimiters-mode))


(use-package company-quickhelp
   :ensure t
   :config
   (defun load-company-face ()
     (require 'color)
     (setq company-tooltip-limit 10
	   company-tooltip-flip-when-above t
	   company-tooltip-maximum-width 70
	   company-tooltip-minimum-width 15
	   company-quickhelp-color-foreground (color-lighten-name (face-attribute 'default :foreground) 10)
	   company-quickhelp-color-background (color-lighten-name (face-attribute 'default :background) 10)
	   pos-tip-foreground-color (face-attribute 'default :foreground) ; set pos-tip font color to the same as the theme
	   company-tooltip-align-annotations t ; align annotations to the right tooltip border
	   company-quickhelp-delay '1.0
	   company-quickhelp-use-propertized-text t)
     (let ((bg (face-attribute 'default :background)))
       (custom-set-faces
	`(company-tooltip ((t (:inherit default :background ,(color-darken-name bg 10)))))
	`(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
	`(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 10)))))
	`(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
	`(company-tooltip-common ((t (:inherit font-lock-constant-face)))))))
   (add-hook 'company-mode-hook 'load-company-face)
   (company-quickhelp-mode nil)
   :hook
   ((emacs-lisp-mode . (lambda () (company-mode)))))

(use-package fsharp-mode
   :ensure t
   :mode (("\\.fs$"  .  fsharp-mode)
	  ("\\.fsx$" .  fsharp-mode)
	  ("\\.fsi$" .  fsharp-mode))
   :hook ((fsharp-mode      . lsp-deferred))
   :bind
   (("C-c C-,"     . 'fsharp-shift-region-left)
    ("C-c C-."     . 'fsharp-shift-region-right)
    ("C-o"         . 'fsharp-newline-and-indent)
    ("C-c C-i"     . 'run-fsharp)
    ("C-c C-a"     . 'fsharp-find-alternate-file)
    ("M-h"         . 'fsharp-mark-phrase))
   :config
   (setq compile-command "dotnet watch run")
   (setq inferior-fsharp-program "dotnet fsi"))

(use-package monokai-pro-theme 
  :ensure t
  :load-path "themes"
  :config
  (load-theme 'monokai-pro-octagon t)
  )

