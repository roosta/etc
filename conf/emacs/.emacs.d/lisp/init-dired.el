;;; init-dired.el --- file browsing using dired      -*- lexical-binding: t; -*-
;;; Commentary:
;;
;;; Code:

(require 'init-utils)
(require 'dired)

(general-def 'normal
  "-" #'dired-jump)

(after-load 'diff-hl
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(general-unbind 'normal dired-mode-map
  "SPC")

(provide 'init-dired)
;;; init-dired.el ends here
