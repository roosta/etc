;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(defvar company-backends)

(use-package company
  :demand t
  :diminish company-mode
  :init
  (setq company-idle-delay 0)                   ; Trigger completion immediately.
  (setq company-show-numbers t)                 ; Number the candidates (use M-1, M-2 etc to select completions).
  (setq auto-completion-enable-sort-by-usage t) ; sort candidates by usage
  (setq company-tooltip-align-annotations 't)   ; align annotations to the right tooltip border
  (setq company-tooltip-limit 20)               ; bigger popup window
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :general
  (company-active-map
   "C-/"     #'counsel-company
   "C-_"     #'counsel-company
   "C-d"     #'company-show-doc-buffer))

(use-package company-tabnine
  :demand t
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
