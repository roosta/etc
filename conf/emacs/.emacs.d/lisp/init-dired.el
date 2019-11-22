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

(use-package diredfl
  :commands
  (diredfl-global-mode)
  :config
  (diredfl-global-mode 1))

(provide 'init-dired)
;;; init-dired.el ends here
