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

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

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

;; Move custom configuration out to specifc file
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

;;; Ivy Completion
(use-package counsel
  :after ivy
  :config (counsel-mode 1))
(use-package ivy
  :diminish
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

;;; Doom Modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))
