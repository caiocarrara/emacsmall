(prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(setq iso-transl-char-map nil)          ; http://emacs.stackexchange.com/a/17524/2138
(setq load-prefer-newer t)

;; Package management
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages
(use-package gruvbox-theme :ensure t :defer 5)

(load-theme 'gruvbox t)

;; Customization
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell t)
(setq inhibit-splash-screen t)
(setq semanticdb-default-save-directory "/tmp")

(setq column-number-mode t)
(global-display-line-numbers-mode)

(electric-pair-mode 1)

(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)
