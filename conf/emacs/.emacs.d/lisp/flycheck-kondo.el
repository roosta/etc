;;; flycheck-kondo.el --- kondo flycheck configuration  -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(flycheck-define-checker clj-kondo-clj
  "See https://github.com/borkdude/clj-kondo"
  :command ("clj-kondo" "--cache" "--lang" "clj" "--lint" "-")
  :standard-input t
  :error-patterns
  ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojure-mode clojurec-mode)
  :predicate (lambda () (not (string= "edn" (file-name-extension (buffer-file-name)))))
  ;; use this when you also use the joker linter, recommended!
  :next-checkers ((error . clojure-joker) (warning . clojure-joker)))

(flycheck-define-checker clj-kondo-cljs
  "See https://github.com/borkdude/clj-kondo"
  :command ("clj-kondo" "--cache" "--lang" "cljs" "--lint" "-")
  :standard-input t
  :error-patterns
  ((error line-start "<stdin>:" line ":" column ": " (0+ not-newline) (or "error: " "Exception: ") (message) line-end)
   (warning line-start "<stdin>:" line ":" column ": " (0+ not-newline) "warning: " (message) line-end))
  :modes (clojurescript-mode)
  :predicate (lambda () (not (string= "edn" (file-name-extension (buffer-file-name)))))
  ;; use this when you also use the joker linter, recommended!
  :next-checkers ((error . clojurescript-joker) (warning . clojurescript-joker)))

(add-to-list 'flycheck-checkers 'clj-kondo-clj)
(add-to-list 'flycheck-checkers 'clj-kondo-cljs)

(provide 'flycheck-kondo)
;;; flycheck-kondo.el ends here
