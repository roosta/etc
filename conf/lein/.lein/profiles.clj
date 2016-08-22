{:user {:dependencies [[pjstadig/humane-test-output "0.8.0"]
                       [alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       ]
        :plugins [[cider/cider-nrepl "0.14.0-SNAPSHOT"]
                  [venantius/ultra "0.4.1"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]
                  [lein-ancient "0.6.10"]
                  [jonase/eastwood "0.2.3"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.1.2"]]
        :ultra {:color-scheme :solarized_dark}
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}

 :android-common {:android {:sdk-path "/home/roosta/lib/android-sdk-linux"}}
 :android-user {:dependencies [[cider/cider-nrepl "0.9.1"]]
                :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                           "cider.nrepl" "cider-nrepl.plugin"]}}}
