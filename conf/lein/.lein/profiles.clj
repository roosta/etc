{:user {:dependencies [[pjstadig/humane-test-output "0.8.0"]]
        :plugins [
                  [lein-cljfmt "0.5.3"]
                  [cider/cider-nrepl "0.13.0"]
                  [venantius/ultra "0.4.1"]
                  [lein-ancient "0.6.10"]
                  [jonase/eastwood "0.2.3"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.1.2"]]
        ; :repl-options {:init (require 'cljfmt.core)}
        :ultra {:color-scheme :solarized_dark}
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}

 :android-common {:android {:sdk-path "/home/roosta/lib/android-sdk-linux"}}
 :android-user {:dependencies [[cider/cider-nrepl "0.9.1"]]
                :android {:aot-exclude-ns ["cider.nrepl.middleware.util.java.parser"
                                           "cider.nrepl" "cider-nrepl.plugin"]}}}
