;; Adding MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

(load-file "~/.emacs.d/controls.el")
;;(load-file "~/.emacs.d/fsharp.el")
(load-file "~/.emacs.d/config.el")

(load-theme 'monokai-pro-octagon t)

(set-frame-font "iosevka curly extended 11" nil t)

;; Remove menu bar
(menu-bar-mode 0)
;; Remove tool bar
(tool-bar-mode 0)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(global-set-key (kbd "C-z") 'undo)

;; Replace highlighted text with what I type
(delete-selection-mode 1)

(require 'eglot-fsharp)

;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))

(require 'company)
(require 'eglot)

(defun my-function ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.*\\'" buffer-file-name))
    (company-mode (current-buffer))))

(add-hook 'find-file-hook 'my-function)
(add-hook 'fsharp-mode-hook 'eglot-ensure)

(setq lsp-lens-enable nil)
