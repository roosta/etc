{:user {:dependencies [[com.cemerick/piggieback "0.2.1"]
                       [org.clojure/clojurescript "1.9.293"]
                       [org.clojure/clojure "1.9.0-alpha14"] ]

        :plugins [[lein-ancient "0.6.10"]
                  [jonase/eastwood "0.2.3"]
                  [lein-pprint "1.1.2"]
                  [lein-kibit "0.1.3"]]}

 :repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}

 :repl {:plugins [[cider/cider-nrepl "0.15.0-SNAPSHOT"]
                  [venantius/ultra "0.5.1"]
                  ]
        :ultra {:color-scheme :solarized_dark}
        :dependencies [
                       ; [alembic "0.3.2"]
                       ; [acyclic/squiggly-clojure "0.1.7"]
                       [org.clojure/tools.nrepl "0.2.12"]]}

 :android-common {:android {:sdk-path "/home/roosta/lib/android-sdk-linux"}}
 :android-user {:dependencies [[cider/cider-nrepl "0.15.0-SNAPSHOT"]]
                :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                           "cider.nrepl" "cider-nrepl.plugin"]}}}
