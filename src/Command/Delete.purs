module Command.Delete
  ( command
  ) where

import Prelude

import Client (Client)
import Client as Client
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Effect.Exception as Exception

command :: Client -> Array String -> Aff Unit
command client [id] = do
  _ <- client `Client.destroy` { id }
  Console.log "deleted"
command _ _ = liftEffect (Exception.throw "no id")
