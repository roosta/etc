;;; init-elisp.el --- Initialize emacs lisp          -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Daniel Berg

;; Author: Daniel Berg <mail@roosta.sh>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'lisp-functions)

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
;; Hooks
;;----------------------------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)

;;----------------------------------------------------------------------------
;; auto-compile
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
;; refactor
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
;; Fix indent in lisp
;;----------------------------------------------------------------------------

;; Fix indentation keyword align
(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq-local lisp-indent-function #'Fuco1/lisp-indent-function)))

;;----------------------------------------------------------------------------
;; Show matching parenthesis
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook #'show-paren-mode)

;;----------------------------------------------------------------------------
;; Linting/flycheck
;;----------------------------------------------------------------------------
(use-package package-lint)

(use-package flycheck-package
  :after
  (flycheck package-lint)
  :config
  (flycheck-package-setup))

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
;;----------------------------------------------------------------------------
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

(provide 'init-elisp)
;;; init-elisp.el ends here
