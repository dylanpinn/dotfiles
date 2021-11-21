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
;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

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
(use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

;;; Doom Modeline
(use-package doom-modeline
  :config
  (doom-modeline-mode 1))

;;; Doom Themes
(use-package doom-themes
  :config
  (load-theme 'doom-palenight)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;;; which-key
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

;;; Helpful
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-key helpful-at-point
			      helpful-function helpful-command)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind (([remap describe-key] . helpful-key)
	 ("C-c C-d" . helpful-at-point)
	 ([remap describe-function] . helpful-function)
	 ([remap describe-command] . helpful-command)))
