;;; init-javascript.el --- Setup javascript development environment  -*- lexical-binding: t; -*-
;;; Commentary:
;;

;;; Code:

;;----------------------------------------------------------------------------
;; js2-mode
;;----------------------------------------------------------------------------
(use-package js2-mode
  :mode ("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode)
  :interpreter ("node" . js2-mode)
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "w"  'js2-mode-toggle-warnings-and-errors
   "zc" 'js2-mode-hide-element
   "zo" 'js2-mode-show-element
   "zr" 'js2-mode-show-all
   "ze" 'js2-mode-toggle-element
   "zF" 'js2-mode-toggle-hide-functions
   "zC" 'js2-mode-toggle-hide-comments)
  :config
  (which-key-add-major-mode-key-based-replacements 'js2-mode
    ", h" "documentation"
    ", g" "goto"
    ", r" "refactor"
    ", z" "folding"

    ;; js2-refactor
    ", r3" "ternary"
    ", ra" "add/args"
    ", rb" "barf"
    ", rc" "contract"
    ", re" "expand/extract"
    ", ri" "inline/inject/introduct"
    ", rl" "localize/log"
    ", rr" "rename"
    ", rs" "split/slurp"
    ", rt" "toggle"
    ", ru" "unwrap"
    ", rv" "var"
    ", rw" "wrap"
    ", x" "text"
    ", xm" "move"

    ;; Skewer-mode
    ", s" "skewer"
    ", e" "eval"))

(use-package js2-refactor
  :hook (js2-mode . js2-refactor-mode)
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "r3i" 'js2r-ternary-to-if
   "rag" 'js2r-add-to-globals-annotation
   "rao" 'js2r-arguments-to-object
   "rba" 'js2r-forward-barf
   "rca" 'js2r-contract-array
   "rco" 'js2r-contract-object
   "rcu" 'js2r-contract-function
   "rea" 'js2r-expand-array
   "ref" 'js2r-extract-function
   "rem" 'js2r-extract-method
   "reo" 'js2r-expand-object
   "reu" 'js2r-expand-function
   "rev" 'js2r-extract-var
   "rig" 'js2r-inject-global-in-iife
   "rip" 'js2r-introduce-parameter
   "riv" 'js2r-inline-var
   "rlp" 'js2r-localize-parameter
   "rlt" 'js2r-log-this
   "rrv" 'js2r-rename-var
   "rsl" 'js2r-forward-slurp
   "rss" 'js2r-split-string
   "rsv" 'js2r-split-var-declaration
   "rtf" 'js2r-toggle-function-expression-and-declaration
   "ruw" 'js2r-unwrap
   "rvt" 'js2r-var-to-this
   "rwi" 'js2r-wrap-buffer-in-iife
   "rwl" 'js2r-wrap-in-for-loop
   "k"   'js2r-kill
   "xmj" 'js2r-move-line-down
   "xmk" 'js2r-move-line-up
   ))

;;----------------------------------------------------------------------------
;; JSON
;;----------------------------------------------------------------------------
(use-package json-mode)

(use-package json-snatcher
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "hp" 'json-print-path))

;;----------------------------------------------------------------------------
;; Beutify
;;----------------------------------------------------------------------------
(use-package web-beautify
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "="  'web-beautify-js)
  ('(normal visual evilified) json-mode-map :prefix ","
   "="  'web-beautify-js)
  ('(normal visual evilified) web-mode :prefix ","
   "="  'web-beautify-html)
  ('(normal visual evilified) css-mode :prefix ","
   "="  'web-beautify-css))

;; https://github.com/mooz/js-doc/

;;----------------------------------------------------------------------------
;; Skewer
;;----------------------------------------------------------------------------
(use-package simple-httpd
  :init
  (setq httpd-port 8081))

(use-package skewer-mode
  :hook ((js2-mode css-mode html-mode) . skewer-mode)
  :general
  ('(normal visual evilified) js2-mode-map :prefix ","
   "'"  'skewer//start-repl
   "ee" 'skewer-eval-last-expression
   "eE" 'skewer-eval-print-last-expression
   "sb" 'skewer-load-buffer
   "sB" 'skewer//load-buffer-and-focus
   "si" 'skewer//start-repl
   "sf" 'skewer-eval-defun
   "sF" 'skewer//eval-defun-and-focus
   "sr" 'skewer//eval-region
   "sR" 'skewer//skewer-eval-region-and-focus
   "ss" 'skewer-repl)
  :config
  (defun skewer//start-repl ()
    "Attach a browser to Emacs and start a skewer REPL."
    (interactive)
    (run-skewer)
    (skewer-repl))

  (defun skewer//eval-defun-and-focus ()
    "Execute function at point in browser and switch to REPL in insert state."
    (interactive)
    (skewer-eval-defun)
    (skewer-repl)
    (evil-insert-state))

  (defun skewer//eval-region (beg end)
    "Execute the region as JavaScript code in the attached browser.
Takes a beginning BEG, and end END"
    (interactive "r")
    (skewer-eval (buffer-substring beg end) #'skewer-post-minibuffer))

  (defun skewer//eval-region-and-focus (beg end)
    "Execute the region in browser and swith to REPL in insert state.
Takes a beginning BEG, and end END."
    (interactive "r")
    (skewer//skewer-eval-region beg end)
    (skewer-repl)
    (evil-insert-state)))

(provide 'init-javascript)
;;; init-javascript.el ends here
