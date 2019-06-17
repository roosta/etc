;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package company
  :demand t
  :init
  (setq company-idle-delay 0.2)
  (setq auto-completion-enable-sort-by-usage t)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :general
  (company-active-map
   "C-/"     #'counsel-company
   "C-_"     #'counsel-company
   "C-d"     #'company-show-doc-buffer))

(general-def
  "C-/" #'counsel-company
  "C-_" #'counsel-company
  )

(provide 'init-company)
;;; init-company.el ends here
