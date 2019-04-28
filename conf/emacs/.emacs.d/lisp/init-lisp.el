;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (smartparens-strict-mode t))

(use-package evil-cleverparens
  :init
  (setq
   evil-cleverparens-use-additional-movement-keys t
   evil-cleverparens-use-s-and-S nil
   evil-cleverparens-swap-move-by-word-and-symbol nil)
  :config
  (require 'evil-cleverparens)
  (require 'evil-cleverparens-text-objects)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode))

(use-package elisp-slime-nav
  :config
  (require 'elisp-slime-nav)
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))

(general-def 'normal emacs-lisp-mode-map
  "K" 'elisp-slime-nav-describe-elisp-thing-at-point)

(provide 'init-lisp)
;;; init-lisp.el ends here

