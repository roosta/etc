;;; init-flycheck.el --- Configure flycheck              -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))

(use-package flycheck-joker
  :after
  (flycheck)
  :config
  (require 'flycheck-joker))

(require 'flycheck-kondo)

(use-package flycheck-popup-tip
  :after
  (flycheck)
  :config
  (flycheck-popup-tip-mode))

(defun flycheck-disable-on-temp-buffers ()
  "Disable flycheck in temporary buffers."
  (unless (and buffer-file-name (file-exists-p buffer-file-name))
    (flycheck-mode -1)))

(add-hook 'markdown-mode-hook 'flycheck-disable-on-temp-buffers)
(add-hook 'clojure-mode-hook 'flycheck-disable-on-temp-buffers)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
