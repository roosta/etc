;;; init-org.el --- Org-mode configuration           -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package org-bullets
  :load-path "~/src/org-bullets"
  :init
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  :config
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-org)
;;; init-org.el ends here
