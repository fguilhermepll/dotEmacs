(load-file "~/.emacs.d/controls.el")

(load-theme 'exotica t)
(set-frame-font "Fira Code 11" nil t)

;; Adding MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Remove menu bar
(menu-bar-mode 0)
;; Remove tool bar
(tool-bar-mode 0)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(global-set-key (kbd "C-z") 'undo)

;; Replace highlighted text with what I type
(delete-selection-mode 1)
