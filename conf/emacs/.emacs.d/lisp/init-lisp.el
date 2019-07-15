;;; init-lisp.el --- Common config for lisps  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'init-utils)
(require 'lisp-functions)

;;----------------------------------------------------------------------------
;; Hooks
;;----------------------------------------------------------------------------

;; Fix indentation keyword align
(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq-local lisp-indent-function #'Fuco1/lisp-indent-function)))

;; Show matching parenthesis
(add-hook 'after-init-hook #'show-paren-mode)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;;----------------------------------------------------------------------------
;; smartparens
;;----------------------------------------------------------------------------
(use-package smartparens
  :commands
  (smartparens-global-strict-mode
   smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode)
  (add-hook 'eshell-mode-hook #'smartparens-strict-mode))

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
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'eshell-mode-hook #'evil-cleverparens-mode)
  )


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
;; Evil lisp state
;;----------------------------------------------------------------------------
(use-package evil-lisp-state
  :general
  ('(normal visual evilified) (emacs-lisp-mode-map lisp-interaction-mode-map) :prefix ","
   "el" #'lisp-state-eval-sexp-end-of-line
   ","  #'lisp-state-toggle-lisp-state
   "e$" #'lisp-state-eval-sexp-end-of-line))

(use-package bind-map)


;;----------------------------------------------------------------------------
;; auto compile
;;----------------------------------------------------------------------------
(use-package auto-compile
  :commands
  (auto-compile-display-log)
  :general
  ('(normal visual evilified) emacs-lisp-mode-map :prefix ","

  ;; "df" 'spacemacs/edebug-instrument-defun-on
  ;; "dF" 'spacemacs/edebug-instrument-defun-off
   "cl" #'auto-compile-display-log))


;;----------------------------------------------------------------------------
;; semantic-refactor
;;----------------------------------------------------------------------------
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
;; General keybindings
;;----------------------------------------------------------------------------

(require 'edebug)

(general-def '(normal visual evilified) edebug-mode-map
  "a" #'edebug-stop
  "s" #'edebug-step-mode
  "S" #'edebug-next-mode)

(general-define-key
 :states  '(normal visual evilified)
 :keymaps '(emacs-lisp-mode-map
            lisp-interaction-mode-map)
 :prefix  ","
 "cc" #'emacs-lisp-byte-compile
 "eb" #'eval-buffer
 "eC" #'spacemacs/eval-current-form
 "ee" #'eval-last-sexp
 "er" #'eval-region
 "ef" #'eval-defun
 "gG" #'spacemacs/nav-find-elisp-thing-at-point-other-window
 "tb" #'spacemacs/ert-run-tests-buffer
 "tq" #'ert

 "hh" #'elisp-slime-nav-find-elisp-thing-at-point

 "'"  #'ielm
 "si" #'ielm

 "dt" #'spacemacs/elisp-toggle-debug-expr-and-eval-func

 "ec" #'spacemacs/eval-current-form-sp
 "es" #'spacemacs/eval-current-symbol-sp
 )

;; Add replacements
;; ----------------
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
