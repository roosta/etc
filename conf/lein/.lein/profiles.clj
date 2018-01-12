{:user {:dependencies [;; nREPL support for ClojureScript REPLs 
                       [com.cemerick/piggieback "0.2.2"]]

        :plugins [;; check deps for new versions
                  [lein-ancient "0.6.15"]

                  ;; cider debugging
                  [com.billpiel/sayid "0.0.15"]

                  ;; clojure syntax checking
                  [jonase/eastwood "0.2.6-beta2"]

                  ;; generate page from doc-strings
                  [lein-codox "0.10.3"]

                  ;; pretty print
                  [lein-pprint "1.2.0"]

                  ;; clojure/script syntax checking
                  [lein-kibit "0.1.6"]]}

 :repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}
 :figwheel {:nrepl-middleware ["cemerick.piggieback/wrap-cljs-repl"]}
 }
