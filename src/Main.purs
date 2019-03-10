module Main
  ( main
  ) where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe)
import Data.Maybe as Maybe
import Effect (Effect)
import Effect.Console as Console
import Effect.Exception as Exception
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
  args <- map (Array.drop 2) Process.argv
  Console.logShow args
  configMaybe <- loadConfig
  config <- Maybe.maybe (Exception.throw "invalid config") pure configMaybe
  Console.logShow config
