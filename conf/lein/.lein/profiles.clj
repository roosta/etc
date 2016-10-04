{:user {:dependencies [[pjstadig/humane-test-output "0.8.1"]
                       [alembic "0.3.2"]
                       [org.clojure/clojure "1.8.0"]]
        :plugins [[lein-ancient "0.6.10"]
                  [jonase/eastwood "0.2.3"]
                  [lein-pprint "1.1.2"]
                  [lein-kibit "0.1.2"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}

 :repl {:plugins [[cider/cider-nrepl "0.14.0-SNAPSHOT"]
                  [venantius/ultra "0.5.0"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]]
        :ultra {:color-scheme :solarized_dark}
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]]}

 :android-common {:android {:sdk-path "/home/roosta/lib/android-sdk-linux"}}
 :android-user {:dependencies [[cider/cider-nrepl "0.14.0-SNAPSHOT"]]
                :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                           "cider.nrepl" "cider-nrepl.plugin"]}}}
