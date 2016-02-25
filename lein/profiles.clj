{:user {:dependencies [[pjstadig/humane-test-output "0.7.1"]]

        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]

        :plugins [[cljfmt "0.3.0"]
                  [cider/cider-nrepl "0.10.2"]
                  [venantius/ultra "0.4.0"]
                  [lein-ancient "0.6.8"]
                  [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]]

        :repl {:plugins [[cider/cider-nrepl "0.10.2"]]}

        :ultra {:color-scheme :solarized_dark}}}
