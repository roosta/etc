{:user {:dependencies [;; nREPL support for ClojureScript REPLs 
                       [cider/piggieback "0.3.6"]
                       [org.clojure/tools.nrepl "0.2.13"]
                       ; [com.bhauman/rebel-readline "0.1.2"]
                       ]

        ; :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"] }

        :plugins [;; check deps for new versions
                  [lein-ancient "0.6.15"]

                  ;; clojure syntax checking
                  [jonase/eastwood "0.2.6" :exclusions [org.clojure/clojure]]

                  ;; try libraries in a repl
                  ;; Emacs: In your *scratch* buffer, set your inferior-lisp-program var...
                  ; (setq inferior-lisp-program "lein try tentacles")
                  ; and then launch M-x inferior-lisp.
                  [lein-try "0.4.3"]

                  ;; pretty print
                  [lein-pprint "1.2.0"]

                  ;; clojure/script syntax checking
                  [lein-kibit "0.1.6" :exclusions [org.clojure/clojure]]]}

 :repl-options {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}
