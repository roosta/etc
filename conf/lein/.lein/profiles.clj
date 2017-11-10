{:user {:dependencies [;; nREPL support for ClojureScript REPLs 
                       ; [com.cemerick/piggieback "0.2.2"]

                       ;; alternative pprinter
                       ; [mvxcvi/puget "1.0.1"]

                       [org.clojure/tools.nrepl "0.2.13"]

                       ;; namespace tools for user/repl
                       [org.clojure/tools.namespace "0.3.0-alpha4"] ]

        :plugins [;; check deps for new versions
                  [lein-ancient "0.6.12"]

                  ;; cider debugging
                  [com.billpiel/sayid "0.0.15"]

                  ;; clojure syntax checking
                  [jonase/eastwood "0.2.4"]

                  ;; generate page from doc-strings
                  [lein-codox "0.10.3"]

                  ;; pretty print
                  [lein-pprint "1.1.2"]

                  ;; clojure/script syntax checking
                  [lein-kibit "0.1.6-beta2"]]}

 :repl-options {; :nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]
                ; :init (set! *print-length* 100)}
                :nrepl-middleware [cider.nrepl.middleware.apropos/wrap-apropos
                                   cider.nrepl.middleware.classpath/wrap-classpath
                                   cider.nrepl.middleware.complete/wrap-complete
                                   cider.nrepl.middleware.debug/wrap-debug
                                   cider.nrepl.middleware.format/wrap-format
                                   cider.nrepl.middleware.info/wrap-info
                                   cider.nrepl.middleware.inspect/wrap-inspect
                                   cider.nrepl.middleware.macroexpand/wrap-macroexpand
                                   cider.nrepl.middleware.ns/wrap-ns
                                   cider.nrepl.middleware.pprint/wrap-pprint
                                   cider.nrepl.middleware.pprint/wrap-pprint-fn
                                   cider.nrepl.middleware.refresh/wrap-refresh
                                   cider.nrepl.middleware.resource/wrap-resource
                                   cider.nrepl.middleware.stacktrace/wrap-stacktrace
                                   cider.nrepl.middleware.test/wrap-test
                                   cider.nrepl.middleware.trace/wrap-trace
                                   cider.nrepl.middleware.out/wrap-out
                                   cider.nrepl.middleware.undef/wrap-undef
                                   cider.nrepl.middleware.version/wrap-version]}

 :repl {:plugins [[cider/cider-nrepl "0.16.0-SNAPSHOT"]

                  ;; syntax highlight terminal repl
                  [venantius/ultra "0.5.1"]

                  ;; flycheck-clojure support for cider 'attach'
                  [acyclic/squiggly-clojure "0.1.9-SNAPSHOT" :exclusions [org.clojure/tools.reader]]

                  ;; cider setup
                  [refactor-nrepl "2.4.0-SNAPSHOT"]]

        :ultra {:color-scheme :solarized_dark}

        :dependencies [;; cider setup
                       [org.clojure/tools.nrepl "0.2.13"]
                       ;; cider setup
                       [alembic "0.3.2"]]}}
