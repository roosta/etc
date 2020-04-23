;;; init-lisp.el --- Common config for lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-utils)

;;----------------------------------------------------------------------------
;; Packages
;;----------------------------------------------------------------------------
(use-package smartparens
  :diminish smartparens-mode
  :hook (ehshell-mode . smartparens-strict-mode)
  :commands
  (smartparens-global-strict-mode
   smartparens-strict-mode)
  :config
  (require 'smartparens-config))

(use-package evil-cleverparens
  :after (evil)
  :diminish evil-cleverparens-mode
  :custom
  (evil-cleverparens-use-additional-movement-keys t)
  (evil-cleverparens-use-s-and-S nil)
  (evil-cleverparens-swap-move-by-word-and-symbol nil)
  :config
  (require 'evil-cleverparens-text-objects)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'eshell-mode-hook #'evil-cleverparens-mode))

(comment
 (use-package evil-smartparens
   :diminish evil-smartparens-mode
   :hook ((prog-mode . evil-smartparens-mode)
          (emacs-lisp-mode . evil-smartparens-mode)
          (lisp-interaction-mode . evil-smartparens-mode)
          (eshell-mode . evil-smartparens-mode)
          (clojure-mode . evil-smartparens-mode)
          (clojurescript-mode) .evil-smartparens-mode)))

(comment
 (use-package paren-face
  :init
  (setq paren-face-regexp "[][(){}]")
  :config
  (global-paren-face-mode 1)))

(use-package bind-map)

(use-package evil-lisp-state
  :demand t
  :init
  (setq evil-lisp-state-global t)
  :config
  (evil-lisp-state-leader "SPC l")
  :general
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map) :prefix ","
   "el" #'lisp-state-eval-sexp-end-of-line
   ","  #'lisp-state-toggle-lisp-state
   "e$" #'lisp-state-eval-sexp-end-of-line)
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "." #'lisp-state-toggle-lisp-state))

(provide 'init-lisp)
;;; init-lisp.el ends here
