; UI - Clean up

; Remove startup message
(setq inhibit-startup-message t)

; Disable visible scrollbar
(scroll-bar-mode -1)

; Disable tooltips
(tooltip-mode -1)

; Disable the toolbar
(tool-bar-mode -1)

; Give some breathing room
(set-fringe-mode 10)

; Disable the menu bar
(menu-bar-mode -1)

; Set up the visible bell
(setq visible-bell t)

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Custom Package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
