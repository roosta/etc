;;; init-lisp.el --- Common config for lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-utils)

;;----------------------------------------------------------------------------
;; Packages
;;----------------------------------------------------------------------------
(use-package smartparens
  :diminish smartparens-mode
  :commands
  (smartparens-global-strict-mode
   smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode)
  (add-hook 'eshell-mode-hook #'smartparens-strict-mode))

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

(use-package elisp-slime-nav
  :general
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map)
   "K" #'elisp-slime-nav-describe-elisp-thing-at-point)
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))

(use-package bind-map)

(use-package evil-lisp-state
  :demand t
  :init
  (setq evil-lisp-state-global t)
  :general
  (evil-lisp-state-leader ", k")
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map) :prefix ","
   "el" #'lisp-state-eval-sexp-end-of-line
   ","  #'lisp-state-toggle-lisp-state
   "e$" #'lisp-state-eval-sexp-end-of-line)
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "." #'lisp-state-toggle-lisp-state))

(use-package auto-compile
  :commands
  (auto-compile-display-log)
  :general
  ('(normal visual evilified) emacs-lisp-mode-map :prefix ","

  ;; "df" 'spacemacs/edebug-instrument-defun-on
  ;; "dF" 'spacemacs/edebug-instrument-defun-off
   "cl" #'auto-compile-display-log))


(use-package srefactor
  :commands
  (srefactor-lisp-format-buffer
   srefactor-lisp-format-defun
   srefactor-lisp-format-sexp
   srefactor-lisp-one-line)
  :config
  (require 'srefactor-lisp)
  :general
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map) :prefix ","
   "=b" #'srefactor-lisp-format-buffer
   "=d" #'srefactor-lisp-format-defun
   "=o" #'srefactor-lisp-one-line
   "=s" #'srefactor-lisp-format-sexp))


;;----------------------------------------------------------------------------
;; Fix indent in lisp
;;----------------------------------------------------------------------------
(require 'lisp-functions)

;; Fix indentation keyword align
(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq-local lisp-indent-function #'Fuco1/lisp-indent-function)))

;; Show matching parenthesis
(add-hook 'after-init-hook #'show-paren-mode)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)


;;----------------------------------------------------------------------------
;; General keybindings
;;----------------------------------------------------------------------------
(general-def '(normal visual evilified) edebug-mode-map
  "a" 'edebug-stop
  "s" 'edebug-step-mode
  "S" 'edebug-next-mode)

(general-define-key
 :states  '(normal visual evilified)
 :keymaps '(emacs-lisp-mode-map
            lisp-interaction-mode-map)
 :prefix  ","
 "cc" 'emacs-lisp-byte-compile
 "eb" 'eval-buffer
 "eC" 'spacemacs/eval-current-form
 "ee" 'eval-last-sexp
 "er" 'eval-region
 "ef" 'eval-defun
 "ep" 'eval-print-last-sexp
 "gG" 'spacemacs/nav-find-elisp-thing-at-point-other-window
 "tb" 'spacemacs/ert-run-tests-buffer
 "tq" 'ert

 "hh" 'elisp-slime-nav-find-elisp-thing-at-point

 "'"  'ielm
 "si" 'ielm

 "dt" 'spacemacs/elisp-toggle-debug-expr-and-eval-func

 "ec" 'spacemacs/eval-current-form-sp
 "es" 'spacemacs/eval-current-symbol-sp
 )

;;----------------------------------------------------------------------------
;; Whichkey replacements
;; --------------------
(dolist (m '(emacs-lisp-mode
             lisp-interaction-mode))
  (which-key-add-major-mode-key-based-replacements m
    ", s" "ielm"
    ", d" "debug"
    ", g" "find-symbol"
    ", h" "help"
    ", c" "compile"
    ", e" "eval"
    ", t" "tests"
    ", =" "srefactor"))


(provide 'init-lisp)
;;; init-lisp.el ends here
