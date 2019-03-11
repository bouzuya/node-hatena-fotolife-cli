module Command.List
  ( command
  ) where

import Prelude

import Client (Client)
import Client as Client
import Effect.Aff (Aff)
import Effect.Class.Console as Console

command :: Client -> Array String -> Aff Unit
command client _ = do
  response <- client `Client.index` {}
  Console.log (Client.showListResponse response)
