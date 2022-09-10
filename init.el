;; Adding MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

(load-file "~/.emacs.d/controls.el")
(load-file "~/.emacs.d/config.el")

;; Remove menu bar
(menu-bar-mode 0)
;; Remove tool bar
(tool-bar-mode 0)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(global-set-key (kbd "C-z") 'undo)

;; Replace highlighted text with what I type
(delete-selection-mode 1)

;; use org-bullets-mode for utf8 symbols as org bullets
;;(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))

(setq lsp-lens-enable nil)
