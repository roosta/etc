;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package company
  :demand t
  :diminish company-mode
  :custom
  (company-idle-delay 0.1)                          ; Trigger completion immediately.
  (company-show-numbers t)                          ; Number the candidates (use M-1, M-2 etc to select completions).
  (auto-completion-enable-sort-by-usage t)          ; sort candidates by usage
  (company-tooltip-align-annotations 't)            ; align annotations to the right tooltip border
  (company-tooltip-limit 20)                        ; bigger popup window
  (company-global-modes '(not shell-mode eaf-mode)) ; Don't use company in the following modes
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  :general
  (company-active-map
   "M-q" 'company-other-backend                     ; Switch backend quickly
   "C-/" 'counsel-company
   "C-_" 'counsel-company
   "C-d" 'company-show-doc-buffer))

(use-package company-tabnine
  :demand t
  :commands
  (company-tabnine)
  :config
  (add-to-list 'company-backends #'company-tabnine))

(use-package company-lsp
  :commands company-lsp
  :custom
  (company-tooltip-align-annotations t)
  :config
  (add-to-list 'company-backends #'company-lsp))

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
