;;; Emacs configuration

;;; UI Settings

;; Remove startup message
(setq inhibit-startup-message t)
;; Disable visible scrollbar
(scroll-bar-mode -1)
;; Disable the toolbar
(tool-bar-mode -1)
;; Disable tooltips
(tooltip-mode -1)
;; Add spacing
(set-fringe-mode 10)
;; Disable the menu bar
(menu-bar-mode -1)
;; Set the visual bell
(setq visible-bell t)

;; Basic theme
(load-theme 'wombat)

;;; Setup use-package

;; Initialise package sources
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
(package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
