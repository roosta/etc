;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(defvar company-backends)

(use-package company
  :demand t
  :diminish (company-mode . "[c]")
  :init
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (setq auto-completion-enable-sort-by-usage t)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :general
  (company-active-map
   "C-/"     #'counsel-company
   "C-_"     #'counsel-company
   "C-d"     #'company-show-doc-buffer))

(use-package company-tabnine
  :commands
  (company-tabnine)
  :config
  (add-to-list 'company-backends #'company-tabnine))

(use-package company-tern
  :after
  (company)
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package company-web
  :after (company)
  :config
  (require 'company-web-html))

(general-def
  "C-/" #'counsel-company
  "C-_" #'counsel-company
  )

(provide 'init-company)
;;; init-company.el ends here
