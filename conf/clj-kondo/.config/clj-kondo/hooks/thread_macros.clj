(ns hooks.thread-macros
  (:require [clj-kondo.hooks-api :as api]))

(def consecutive-threshold 2)
(def transduceable #{'map
                     'filter})

(defn consecutive-threading [{:keys [:node]}]
  (let [[_ & forms] (rest (:children node))]
    (loop [forms forms
           counter 0]
      (when-let [form (first forms)]
        (if (contains? transduceable (some-> form :children first api/sexpr))
          (if (>= counter consecutive-threshold)
            (api/reg-finding!
             (assoc (meta node)
                    :message "prefer transducers to consecutive maps or filters in threading macros"
                    :type :expensive-threading))
            (recur (next forms)
                   (inc counter)))
          (recur (next forms)
                 0))))))