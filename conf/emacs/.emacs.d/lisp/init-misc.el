;;; init-misc.el --- Miscellaneous configs not fitting in any of the other init els  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


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
  "SPC w" "windows")

;;----------------------------------------------------------------------------
;;  Ask StackExchange
;;----------------------------------------------------------------------------

(use-package asx
  :general
  ('(normal visual insert emacs) :prefix "SPC" :non-normal-prefix "C-SPC"
   "oaa" #'asx
   "oan" #'asx-next-post
   "oap" #'asx-previous-post
   "oar" #'asx-reload-post
   "oaf" #'asx-go-back-to-first-post))

;;----------------------------------------------------------------------------
;;  Diminish
;;----------------------------------------------------------------------------
(diminish 'eldoc-mode "[ed]")

(provide 'init-misc)
;;; init-misc.el ends here
