;;; init-prescient.el --- Sort company and ivy using prescient.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package prescient
  :demand t
  :commands
  (prescient-persist-mode)
  :config
  (prescient-persist-mode 1))

(use-package company-prescient
  :demand t
  :after (company prescient)
  :config
  (company-prescient-mode 1))

(use-package ivy-prescient
  :demand t
  :after (ivy prescient)
  :config
  (ivy-prescient-mode 1))

(provide 'init-prescient)
;;; init-prescient.el ends here
