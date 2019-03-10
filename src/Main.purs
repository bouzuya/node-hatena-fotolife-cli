module Main
  ( main
  ) where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Console as Console
import Foreign.Object as Object
import Node.Process as Process

type Config =
  { apiKey :: String
  , hatenaId :: String
  }

loadConfig :: Effect (Maybe Config)
loadConfig = do
  env <- Process.getEnv
  pure do
    apiKey <- Object.lookup "HATENA_API_KEY" env
    hatenaId <- Object.lookup "HATENA_ID" env
    pure { apiKey, hatenaId }

main :: Effect Unit
main = do
  config <- loadConfig
  Console.logShow config
