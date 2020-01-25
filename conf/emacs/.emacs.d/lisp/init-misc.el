;;; init-misc.el --- Miscellaneous configs not fitting in any of the other init els  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'init-utils)

;;----------------------------------------------------------------------------
;; which key replacements
;;----------------------------------------------------------------------------
(which-key-add-key-based-replacements
  "SPC S" "spelling"
  "SPC f" "file"
  "SPC g" "git"
  "SPC b" "buffers"
  "SPC h" "help"
  "SPC i" "insert"
  "SPC j" "jump"
  "SPC p" "projects"
  "SPC o" "roosta"
  "SPC oa" "asx"
  "SPC q" "quit"
  "SPC r" "registers/rings/resume"
  "SPC s" "search"
  "SPC w" "windows"
  "SPC n" "numbers")

;;----------------------------------------------------------------------------
;;  Misc packages
;;----------------------------------------------------------------------------

(use-package asx
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "oaa" #'asx
   "oan" #'asx-next-post
   "oap" #'asx-previous-post
   "oar" #'asx-reload-post
   "oaf" #'asx-go-back-to-first-post))

(use-package helpful
  :after
  (ivy counsel)
  :config
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable))

;;----------------------------------------------------------------------------
;;  Diminish
;;----------------------------------------------------------------------------
(diminish 'eldoc-mode)

(after-load 'auto-revert-mode
  (diminish 'auto-revert-mode))

;;----------------------------------------------------------------------------
;;  which-function-mode
;;----------------------------------------------------------------------------
;; (require 'which-func)
;; (after-load 'which-func
;;   '(setq which-func-modes '(java-mode c++-mode org-mode clojure-mode clojurescript-mode)))

;; (which-function-mode 1)

(provide 'init-misc)
;;; init-misc.el ends here
