;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package srcery-theme
             :load-path "~/src/srcery-emacs"
             :init
             (setq srcery-transparent-background t)) 

(setq-default custom-enabled-themes '(srcery-theme))

(provide 'init-theme)

;;; init-themes.el ends here
