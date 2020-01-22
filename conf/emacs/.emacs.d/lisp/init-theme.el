;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package srcery-theme
  :load-path "~/src/srcery-emacs"
  :custom
  (srcery-transparent-background t)
  :config
  (load-theme 'srcery t)
  )

(use-package smart-mode-line
  :defines
  (sml/theme)
  :commands
  (sml/setup)
  :init
  (setq sml/theme 'respectful)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; (setq-default custom-theme-directory "~/src/srcery-emacs")
; (setq-default custom-enabled-themes '(srcery))

; ;; Ensure that themes will be applied even if they have not been customized
; (defun reapply-themes ()
;   "Forcibly load the themes listed in `custom-enabled-themes'."
;   (dolist (theme custom-enabled-themes)
;     (unless (custom-theme-p theme)
;       (load-theme theme)))
;   (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

; (add-hook 'after-init-hook 'reapply-themes)

(provide 'init-theme)
;;; init-theme.el ends here
