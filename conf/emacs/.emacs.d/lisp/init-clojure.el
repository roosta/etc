;;; init-clojure.el --- Setup clojure and clojurescript language  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(require 'init-utils)
(require 'advice)
(require 'init-site-lisp)

(use-package clojure-mode)

;;----------------------------------------------------------------------------
;; Snippets for yasnippet
;;----------------------------------------------------------------------------
(use-package clojure-snippets
  :after (yasnippet))

;;----------------------------------------------------------------------------
;; Cider
;;----------------------------------------------------------------------------
(use-package cider
  :commands
  (cider-javadoc
   cider-doc
   cider-eval-buffer
   cider-eval-last-sexp
   cider-eval-defun-at-point
   cider-eval-region
   cider-eval-last-sexp-and-replace
   cider-pop-back
   cider-pprint-eval-last-sexp
   cider-jump-to-compilation-error
   cider-jack-in
   cider-jack-in-cljs
   cider-load-buffer
   cider-connect
   cider-find-and-clear-repl-output
   cider-switch-to-repl-buffer
   cider-repl-switch-to-other
   cider-quit
   cider-enlighten-mode
   cider-test-show-report
   cider-repl-clear-buffer
   cider-eval-print-last-sexp
   cider-switch-to-last-clojure-buffer
   cider-repl-handle-shortcut)
  :hook
  (cider-repl-mode . eldoc-mode)
  :defines
  (cider-refresh-before-fn cider-refresh-after-fn)
  :init
  (setq cider-refresh-before-fn "user/stop")
  (setq cider-refresh-after-fn "user/go")
  (setq cider-repl-use-pretty-printing t) ; always pretty print in repl
  (setq cider-overlays-use-font-lock t) ; add syntax highlighting to eval overlay
  (setq cider-font-lock-reader-conditionals nil) ; Fix issue where working on cljc files would comment out env paths
  )


;;----------------------------------------------------------------------------
;; highlight evals
;;----------------------------------------------------------------------------
(use-package cider-eval-sexp-fu
  :after (cider))

;;----------------------------------------------------------------------------
;; Functions defined in spacemacs clojure layer
;; https://raw.githubusercontent.com/syl20bnr/spacemacs/master/layers/%2Blang/clojure/funcs.el
;;----------------------------------------------------------------------------

(ensure-lib-from-url
 'clojure-utils
 "https://raw.githubusercontent.com/syl20bnr/spacemacs/develop/layers/%2Blang/clojure/funcs.el")

(load-file (site-lisp-library-el-path 'clojure-utils))

;;----------------------------------------------------------------------------
;; Key definitions
;;----------------------------------------------------------------------------
(general-def cider-repl-mode-map
  "RET" 'cider-repl-newline-and-indent)

(general-define-key
  :states  '(normal visual evilified)
  :keymaps '(clojure-mode-map
             clojurec-mode-map
             clojurescript-mode-map
             clojurex-mode-map
             cider-repl-mode-map
             cider-clojure-interaction-mode-map)
  :prefix  ","
  "ha" #'cider-apropos
  "hh" #'cider-doc

  ;; "hg" #'cider-grimoire
  "hj" #'cider-javadoc
  "hn" #'cider-browse-ns

  "eb" #'cider-eval-buffer
  "ee" #'cider-eval-last-sexp
  "ef" #'cider-eval-defun-at-point
  "em" #'cider-macroexpand-1
  "eM" #'cider-macroexpand-all
  "er" #'cider-eval-region
  "ep" #'cider-eval-print-last-sexp
  "eP" #'cider-pprint-eval-last-sexp
  "ew" #'cider-eval-last-sexp-and-replace

  "="  #'cider-format-buffer
  "fb" #'cider-format-buffer

  "gg" #'cider-find-var
  "gb" #'cider-pop-back
  "gC" #'cider-classpath
  "ge" #'cider-jump-to-compilation-error
  ;; "gr" 'cider-jump-to-resource
  "gn" #'cider-browse-ns
  "gN" #'cider-browse-ns-all

  "'"  #'cider-jack-in
  "\"" #'cider-jack-in-cljs
  "sb" #'cider-load-buffer
  "sB" 'spacemacs/cider-send-buffer-in-repl-and-focus
  "sc" #'cider-connect
  "sC" #'cider-find-and-clear-repl-output
  "se" 'spacemacs/cider-send-last-sexp-to-repl
  "sE" 'spacemacs/cider-send-last-sexp-to-repl-focus
  "sf" 'spacemacs/cider-send-function-to-repl
  "sF" 'spacemacs/cider-send-function-to-repl-focus
  "si" #'cider-jack-in
  "sI" #'cider-jack-in-cljs
  "sn" 'spacemacs/cider-send-ns-form-to-repl
  "sN" 'spacemacs/cider-send-ns-form-to-repl-focus
  "so" #'cider-repl-switch-to-other
  "sq" #'cider-quit
  "sr" 'spacemacs/cider-send-region-to-repl
  "sR" 'spacemacs/cider-send-region-to-repl-focus
  "ss" #'cider-switch-to-repl-buffer
  "sx" #'cider-ns-refresh

  "Te" #'cider-enlighten-mode
  "Tf" 'spacemacs/cider-toggle-repl-font-locking
  "Tp" 'spacemacs/cider-toggle-repl-pretty-printing
  "Tt" #'cider-auto-test-mode

  "ta" 'spacemacs/cider-test-run-all-tests
  "tb" #'cider-test-show-report
  "tl" 'spacemacs/cider-test-run-loaded-tests
  "tp" 'spacemacs/cider-test-run-project-tests
  "tn" 'spacemacs/cider-test-run-ns-tests
  "tr" 'spacemacs/cider-test-rerun-failed-tests
  "tt" 'spacemacs/cider-test-run-focused-test

  "db" #'cider-debug-defun-at-point
  "de" 'spacemacs/cider-display-error-buffer
  "dv" #'cider-inspect

  ;; refactorings from clojure-mode
  "rc{" #'clojure-convert-collection-to-map
  "rc(" #'clojure-convert-collection-to-list
  "rc'" #'clojure-convert-collection-to-quoted-list
  "rc#" #'clojure-convert-collection-to-set)

(general-def '(normal visual evilified) cider-repl-mode-map :prefix ","
  "sc"  #'cider-repl-clear-buffer
  "ss"  #'cider-switch-to-last-clojure-buffer
  ","   #'cider-repl-handle-shortcut)

(general-def '(normal visual evilified) clojure-mode-map
  "K" #'cider-doc)

;;----------------------------------------------------------------------------
;; clj-refactor
;;----------------------------------------------------------------------------
(use-package clj-refactor
  :defines
  (cljr--all-helpers)
  :config
  (dolist (r cljr--all-helpers)
    (let* ((binding (car r))
           (func (car (cdr r))))
      (general-define-key
       :states  '(normal visual evilified)
       :keymaps '(clojure-mode-map
                  clojurec-mode-map
                  clojurescript-mode-map
                  clojurex-mode-map
                  cider-repl-mode-map
                  cider-clojure-interaction-mode-map)
       :prefix  ","
      (concat "r" binding) func))))

(use-package cljr-ivy
  :after (clj-refactor)
  :general
  ('(normal visual evilified)
   '(clojure-mode-map
     clojurescript-mode-map
     clojurec-mode-map
     clojurex-mode-map)
   :prefix ","
   "o" #'cljr-ivy)
  :load-path "~/src/cljr-ivy")

;;----------------------------------------------------------------------------
;; Add prefix descriptions to which-key
;;----------------------------------------------------------------------------
(dolist (m '(clojure-mode
             clojurec-mode
             clojurescript-mode
             clojurex-mode
             cider-repl-mode
             cider-clojure-interaction-mode))
  (which-key-add-major-mode-key-based-replacements m
    ;; root
    ", d" "debug"
    ", e" "evaluation"
    ", g" "goto"
    ", h" "documentation"
    ", s" "repl"
    ", t" "test"
    ", T" "toggle"
    ", f" "format"

    ;; tests
    ", ta" "cider-test-run-all-tests"
    ", tl" "cider-test-run-loaded-tests"
    ", tp" "cider-test-run-project-tests"
    ", tn" "cider-test-run-ns-tests"
    ", tr" "cider-test-rerun-failed-tests"
    ", tt" "cider-test-run-focused-test"

    ;; cljr
    ", r" "refactor"
    ", ra" "add"
    ", rc" "cycle/clean/convert"
    ", rd" "destructure"
    ", re" "extract/expand"
    ", rf" "find/function"
    ", rh" "hotload"
    ", ri" "introduce/inline"
    ", rm" "move"
    ", rp" "project/promote"
    ", rr" "remove/rename/replace"
    ", rs" "show/sort/stop"
    ", rt" "thread"
    ", ru" "unwind/update"
    ))


(provide 'init-clojure)
;;; init-clojure.el ends here
