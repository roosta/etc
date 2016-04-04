{:user {:dependencies [[pjstadig/humane-test-output "0.7.1"]
                       [cljfmt "0.4.1"]
                       [cider/cider-nrepl "0.11.0"]
                       [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]]
        :plugins [[lein-cljfmt "0.4.1"]
                  [cider/cider-nrepl "0.11.0"]
                  [venantius/ultra "0.4.0"]
                  [lein-ancient "0.6.8"]
                  [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.1.2"]]
        :repl-options {:init (require 'cljfmt.core)}
        :ultra {:color-scheme :solarized_dark}
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}
