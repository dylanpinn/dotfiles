;;; Emacs

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

;; Enable column numbering
(column-number-mode t)

;; Show line numbering.
(global-display-line-numbers-mode t)
;; Disable fo some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook
		helpful-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

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
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

;; Counsel - Better Ivy integration
(use-package counsel
  :ensure t
  :config
  (counsel-mode))

;; Rainbow Delimeters - Colourful parens
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Which Key - Useful help prompts
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; Ivy-Rich - Better Ivy formatter
(use-package ivy-rich
  :ensure t
  :init
  (ivy-rich-mode 1))

;; Doom Themes - More comprehensive themes
(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-palenight t))

;; Helpful - Imrpoved Emacs help screens
(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
