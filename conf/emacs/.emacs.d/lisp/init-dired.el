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

;; Set ls options
(setq dired-listing-switches "-lsAhpk --group-directories-first")

(use-package diredfl
  :commands
  (diredfl-global-mode)
  :init
  (setq diredfl-ignore-compressed-flag nil)
  (diredfl-global-mode 1))

(use-package dired-git-info
  :ensure t
  :general
  ('normal dired-mode-map
   ")" #'dired-git-info-mode))

(provide 'init-dired)
;;; init-dired.el ends here
