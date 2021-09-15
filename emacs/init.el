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
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
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
  (setq evil-want-keybinding nil) ; evil-collection requires this.
  (setq evil-want-C-u-scroll t) ; enable C-u & C-d scrolling.
  :config
  (evil-mode))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Org Mode - outliner and organiser
(use-package org
  :ensure t
  :config
  (setq org-agenda-files '("~/notes/work.org"))
  (setq org-todo-keywords
	`((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	  (sequence "BACKLOG(b)" "ACTIVE(a)" "|" "COMPLETED(c)")))
  (setq org-refile-targets
	'(("archive/work-archive.org" :maxlevel . 1)
	  ("work.org" :maxlevel . 1)))
  ;; Save org buffers after refiling.
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
)

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

;; Doom Modeline - Improved statusline.
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

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

;; Projectile - Project management
(use-package projectile
  :diminish projectile-mode
  :ensure t
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/dev")
    (setq projectile-project-search-path '("~/dev")))
  (setq projectile-switch-project-action #'projectile-dired))
(use-package counsel-projectile
  :ensure t
  :after projectile
  :config (counsel-projectile-mode))

;; Magit - Git client
(use-package magit
  :ensure t)
