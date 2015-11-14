{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (AntigenConfig (..),defaultConfig, bundle, antigen)

bundles =
  [ bundle "mafredri/zsh-async"
  , bundle "roosta/pure"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "zsh-users/zsh-history-substring-search"
  , bundle "zsh-users/zsh-completions"
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
