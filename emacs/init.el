;; My Emacs configuration.
;;
;; Currently, this is only being used note taking and task management using org-mode, so the configuration will likely only reflect that at first.

;; UI Configration.

;; Turn off the splash-screen as not really required, and drop into the *scratch* buffer instead.
(setq inhibit-startup-message t)

;; Use visual bell rather than an audible one.
(setq visible-bell t)

;; Disable visible scroll-bar, and only enable when scrolling is available.
(scroll-bar-mode -1)

;; Remove toolbar with icons as want to focus on using keyboard rather than mouse.
(tool-bar-mode -1)
