(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'tango t))
    ('dark (load-theme 'tango-dark t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
