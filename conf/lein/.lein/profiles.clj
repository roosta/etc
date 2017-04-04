{:user {:jvm-opts ^:replace ["-Xmx512M"]
        :dependencies [;; nREPL support for ClojureScript REPLs 
                       [com.cemerick/piggieback "0.2.1"]

                       ;; alternative pprinter
                       ; [mvxcvi/puget "1.0.1"]

                       ;; namespace tools for user/repl
                       [org.clojure/tools.namespace "0.2.11"] ]

        :plugins [;; check deps for new versions
                  [lein-ancient "0.6.10"]

                  ;; clojure syntax checking
                  [jonase/eastwood "0.2.3"]

                  ;; generate page from doc-strings
                  [lein-codox "0.10.3"]

                  ;; pretty print
                  [lein-pprint "1.1.2"]

                  ;; clojure/script syntax checking
                  [lein-kibit "0.1.3"]]}

 :repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}

 :repl {:plugins [[cider/cider-nrepl "0.15.0-SNAPSHOT"]

                  ;; syntax highlight terminal repl
                  [venantius/ultra "0.5.1"]

                  ;; flycheck-clojure support for cider 'attach'
                  [acyclic/squiggly-clojure "0.1.8" :exclusions [org.clojure/tools.reader]]

                  ;; cider setup
                  [refactor-nrepl "2.2.0"]]

        :ultra {:color-scheme :solarized_dark}

        :dependencies [;; cider setup
                       [org.clojure/tools.nrepl "0.2.12"]
                       ;; cider setup
                       [alembic "0.3.2"]]}}
