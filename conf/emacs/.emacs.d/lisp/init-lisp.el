;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


;;----------------------------------------------------------------------------
;; smartparens
;;----------------------------------------------------------------------------
(use-package smartparens
  :config
  (smartparens-global-mode t)
  (smartparens-strict-mode t))


;;----------------------------------------------------------------------------
;; Evil cleverparens
;;----------------------------------------------------------------------------
(use-package evil-cleverparens
  :after (evil)
  :init
  (setq
   evil-cleverparens-use-additional-movement-keys t
   evil-cleverparens-use-s-and-S nil
   evil-cleverparens-swap-move-by-word-and-symbol nil)
  :config
  (require 'evil-cleverparens-text-objects)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
  )

(use-package elisp-slime-nav
  :general
  ('normal emacs-lisp-mode-map
    "K" #'elisp-slime-nav-describe-elisp-thing-at-point)
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))

(provide 'init-lisp)
;;; init-lisp.el ends here

