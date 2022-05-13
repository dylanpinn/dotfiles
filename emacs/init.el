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

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; General
(use-package general
  :config
  (general-create-definer dcp/leader-key
    :keymaps 'normal
    :prefix "SPC")
  (general-create-definer dcp/local-leader-key
    :keymaps 'normal
    :prefix "SPC m")

  (dcp/leader-key
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

;;; Evil
(use-package evil
  :init
  ;; Required for evil-collection.
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  ;; Set same as vim defaults/config.
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-u-delete t)
  (setq evil-move-beyond-eol t)
  :config
  (evil-mode 1)
  ;; Use C-g to escape to NORMAL mode.
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Use C-h to have default Emacs key when in INSERT mode.
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;;; Doom Themes
(use-package doom-themes
  :config
  (load-theme 'doom-palenight t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;;; Doom Modeline
(use-package doom-modeline
  :config
  (doom-modeline-mode 1))
(use-package all-the-icons)

;;; which-key
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

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

(use-package org
  :bind
  ("C-c a" . 'org-agenda)
  ("C-c c" . 'org-capture)
  :config
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  ;; Display headings when opening org files.
  (setq org-startup-folded 'content)

  ;; Setup included files in org-agenda.
  (setq org-agenda-files
	'("~/dev/git.realestate.com.au/dylan-pinn/notes"))

  ;; Setup TODO keywords.
  ;; First is for tasks; Second is for projects.
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
	  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING")))

  ;; Show the daily agenda by default.
  (setq org-agenda-span 'day)

  ;; Hide tasks that are scheduled in the future.
  (setq org-agenda-todo-ignore-scheduled 'future)

  ;; Customised Agenda view for daily workflow.
  (setq org-agenda-custom-commands
	'(("n" "Agenda / NEXT"
	   ((agenda "" nil)
	    (todo "NEXT" nil))
	   nil))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)))

;; Automatically tangle our Emacs.org config file when we save it
(defun dcp/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
		      (expand-file-name "~/.dotfiles/emacs/emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'dcp/org-babel-tangle-config)))

;; Move custom configuration out to specifc file
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-project-search-path '(("~/dev/". 3))))

(use-package magit)
(use-package forge)

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))
