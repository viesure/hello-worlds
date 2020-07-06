{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Network.HTTP.Types

main = scotty 12345 $ do
  get "/hello-world" $ do
    text "Hello, World!"
