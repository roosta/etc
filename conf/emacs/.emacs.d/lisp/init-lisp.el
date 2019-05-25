;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-utils)

;;----------------------------------------------------------------------------
;; smartparens
;;----------------------------------------------------------------------------
(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode))


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
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode))


;;----------------------------------------------------------------------------
;; elisp-slime-nav
;;----------------------------------------------------------------------------
(use-package elisp-slime-nav
  :general
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map)
   "K" #'elisp-slime-nav-describe-elisp-thing-at-point)
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))


;;----------------------------------------------------------------------------
;; Dim parenthesis by using paren-face and srcery theme
;;----------------------------------------------------------------------------
(comment
 (use-package paren-face
  :init
  (setq paren-face-regexp "[][(){}]")
  :config
  (global-paren-face-mode 1)))


;;----------------------------------------------------------------------------
;; Show matching parenthesis
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'show-paren-mode)



(provide 'init-lisp)
;;; init-lisp.el ends here
