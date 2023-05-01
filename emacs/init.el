;; Emacs configuration.

;; Turn off the splash screen as not really required, and start in the *scratch* buffer instead.
(setq inhibit-startup-message t)

;; Use visual bell rather than an an audible one. 
(setq visible-bell t)

;; Remove toolbar with icons as want to focus on using keyboard rather than mouse.
(tool-bar-mode -1)

;; Turn off scroll-bar unless needed.
(scroll-bar-mode -1)

;; Menu bar mode.
;; (menu-bar-mode -1)

;; Turn on line numbers for all files.
(global-display-line-numbers-mode 1)

;; Theme settings
(load-theme 'modus-vivendi t)

;; Use recent files
;; TODO: Check over documentation and add some keybindings.
(recentf-mode 1)

;; Save minibuffer prompt history
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor lcation of opened files.
(save-place-mode 1)

;; Move "custom file" into separate file.
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Revert buffers when the underlying file has changed.
(global-auto-revert-mode 1)

;; Plugins to install
; org-mode
; evil-mode
; which-key

;; Revert Dired and other buffers.
(setq global-auto-revert-no-file-buffers t)

;; Plugin Management

;; use-package
;; Use use-package to install and manage plugins for Emacs.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode)


;; evil-mode for vim keybindings.
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; org-mode
(use-package org)

(setq org-agenda-files (quote ("~/.dotfiles/emacs/test.org")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
