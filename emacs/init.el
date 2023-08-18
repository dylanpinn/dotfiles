(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'tango t))
    ('dark (load-theme 'tango-dark t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Download which-key
(unless (package-installed-p 'which-key)
  (package-install 'which-key))
;; Enable which-key
(require 'which-key)
(which-key-mode)
(setq which-key-idle-delay 0.3)
