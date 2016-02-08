{:user {:dependencies [[cljfmt "0.3.0"]
                       ;[jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                       ]
        :plugins [[cider/cider-nrepl "0.10.0"]
                  [venantius/ultra "0.4.0"]]
        :ultra {:color-scheme :solarized_dark}}}

        ;[cider/cider-nrepl "0.9.1"]
        ;:ultra {:color-scheme :solarized_dark}}}
        ;:ultra {:color-scheme {:delimiter [:red]
                               ;:tag [:red]
                               ;:nil [:cyan]
                               ;:boolean [:cyan]
                               ;:number [:cyan]
                               ;:string [:cyan]
                               ;:character [:cyan]
                               ;:keyword [:green]
                               ;:symbol nil
                               ;:function-symbol [:blue]
                               ;:class-delimiter [:blue]
                               ;:class-name nil
                               ;:exception nil}}}}
