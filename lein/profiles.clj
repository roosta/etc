{:user {:dependencies [[cljfmt "0.3.0"]
                       [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]]
        :plugins [[cider/cider-nrepl "0.10.0"]
                  [venantius/ultra "0.4.0"]]
        :ultra {:color-scheme :solarized_dark}
        :eastwood {:source-paths ["env/dev/clj" "test/clj" "src/clj"]}}}
