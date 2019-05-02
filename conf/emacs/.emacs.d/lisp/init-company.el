;;; init-company.el --- company-mode configuration                 -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
;;; init-company.el ends here
