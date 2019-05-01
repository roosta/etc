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

(provide 'init-flycheck)
;;; init-flycheck.el ends here
