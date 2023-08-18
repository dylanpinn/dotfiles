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

;; Revert Dired and other buffers.
(setq global-auto-revert-no-file-buffers t)

;; Set light/dark theme based on system appearance.
(require 'modus-themes)
(defun dcp/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'modus-operandi t))
    ('dark (load-theme 'modus-vivendi t))))
(add-hook 'ns-system-appearance-change-functions #'dcp/apply-theme)

;; Package Configuration

;; Custom Repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; which-key
(unless (package-installed-p 'which-key)
  (package-install 'which-key))
(require 'which-key)
(which-key-mode)
(setq which-key-idle-delay 0.3)
