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
(use-package gruvbox-theme :ensure t)
;; Python
(use-package anaconda-mode :ensure t)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;Go
(use-package go-mode :ensure t)
;; HTML / Web
(use-package web-mode :ensure t)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq html-indent-level 2)
;; JS
(use-package rjsx-mode :ensure t)
(use-package prettier-js :ensure t)
(add-to-list 'auto-mode-alist '("\\.js?\\'" . rjsx-mode))
(setq js-indent-level 2)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)

;; Theme
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
(setq-default indent-tabs-mode nil)

(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)
