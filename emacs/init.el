;;; init.el -*- lexical-binding: t; -*-

;;; Initial phase.

;; Load the custom file if it exists.  Among other settings, this will
;; have the list `package-selected-packages', so we need to load that
;; before adding more packages.  The value of the `custom-file'
;; variable must be set appropriately, by default the value is nil.
;; This can be done here, or in the early-init.el file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil 'nomessage))

;; Adds crafted-emacs modules to the `load-path', sets up a module
;; writing template, sets the `crafted-emacs-home' variable.
(load "~/dev/github.com/SystemCrafters/crafted-emacs/modules/crafted-init-config")

;;; Packages phase

;; Collect list of packages to install.  Do not just blindly copy this
;; list, instead think about what you need and see if there is a
;; module which provides the list of packages needed.  This phase is
;; not needed if manage the installed packages with Guix or Nix.  It
;; is also not needed if you do not need Crafted Emacs to install
;; packages for a module, for example,
;; `crafted-mastering-emacs-config' does not require any packages to
;; be installed.
(add-to-list 'package-selected-packages 'modus-themes)
(add-to-list 'package-selected-packages 'which-key)

(require 'crafted-completion-packages)
(require 'crafted-evil-packages)
(require 'crafted-org-packages)
(require 'crafted-ui-packages)
(require 'crafted-workspaces-packages)

;; Install the packages listed in the `package-selected-packages' list.
(package-install-selected-packages :noconfirm)

;;; Configuration phase

(setq evil-want-C-u-scroll t)

;; Some example modules to configure Emacs. Don't blindly copy these,
;; they are here for example purposes.  Find the modules which work
;; for you and add them here.
(require 'crafted-completion-config)
(require 'crafted-defaults-config)
(require 'crafted-evil-config)
(require 'crafted-org-config)
(require 'crafted-osx-config)
(require 'crafted-startup-config)
(require 'crafted-ui-config)
(require 'crafted-workspaces-config)

(unless crafted-startup-inhibit-splash
  (setq initial-buffer-choice #'crafted-startup-screen))
;;; Optional configuration

;; UI Configuration.
;; Disable visible scrollbar
(scroll-bar-mode -1)
;; Disable the toolbar
(tool-bar-mode -1)
;; Disable tooltips
(tooltip-mode -1)
;; Emacs Theme
(require 'modus-themes)
(load-theme 'modus-operandi)            ; Light theme
;; (load-theme 'modus-vivendi)             ; Dark theme
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

;; Org Mode Configuration.
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Org Agenda
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
         nil)))

;; Which Key
(require 'which-key)
(which-key-mode)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Crafted Emacs loaded in %s."
                     (emacs-init-time))))

;; Set default coding system (especially for Windows)
(set-default-coding-systems 'utf-8)
