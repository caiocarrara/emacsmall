;;; init.el --- cacarrara emacs config

;;; Commentary:
;;; Defines initial configs
;;; Code:

(prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(setq iso-transl-char-map nil)          ; http://emacs.stackexchange.com/a/17524/2138
(setq load-prefer-newer t)

;; Package management
(require 'package)
(setq package-enable-at-startup nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages
(use-package undo-tree :ensure t)
(require 'undo-tree)
(use-package evil :ensure t)
(require 'evil)
(evil-mode 1)
(use-package gruvbox-theme :ensure t)
(use-package powerline :ensure t)
(powerline-center-evil-theme)
;; Python
(use-package anaconda-mode :ensure t)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;Go
(use-package go-mode :ensure t)
;; HTML / Web
(use-package web-mode :ensure t)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq html-indent-level 2)
;; JS
(use-package rjsx-mode :ensure t)
(use-package prettier-js :ensure t)
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(setq js-indent-level 2)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
;;Syntax checker
(use-package flycheck :ensure t)
(global-flycheck-mode)
;; Org-Mode
(use-package org)
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "POSTPONED(p)" "BLOCKED(b)" "|" "DONE(o)" "CANCELED(c)")))
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/todo.org")
         "* TODO %?")))

;; Theme
(load-theme 'gruvbox t)

;; Customization
(when (member "Hack" (font-family-list)) (set-frame-font "Hack-10.5" t t))
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell t)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(show-paren-mode 1)

(setq column-number-mode t)
(global-display-line-numbers-mode)

(electric-pair-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)

(ido-mode 1)

(provide 'init)
;;; init.el ends here
