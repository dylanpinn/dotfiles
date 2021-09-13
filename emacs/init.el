;; UI - Clean up

;; Remove startup message
(setq inhibit-startup-message t)

;; Disable visible scrollbar
(scroll-bar-mode -1)

;; Disable tooltips
(tooltip-mode -1)

;; Disable the toolbar
(tool-bar-mode -1)

;; Give some breathing room
(set-fringe-mode 10)

;; Disable the menu bar
(menu-bar-mode -1)

;; Set up the visible bell
(setq visible-bell t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Move custom configuration out to specifc file
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

;; Load built-in package manager, add community sources.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Evil - vim keybindings
(use-package evil
  :ensure t ; install the package if not installed
  :init ; tweak evil's configuration before loading it
  (setq evil-want-C-u-scroll t) ; enable C-u & C-d scrolling.
  :config
  (evil-mode))

;; Org Mode - outliner and organiser
(use-package org
  :ensure t)

;; Ivy - completion engine
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))
