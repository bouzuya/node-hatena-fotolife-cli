module Command.Upload
  ( command
  ) where

import Prelude

import Bouzuya.CommandLineOption as CommandLineOption
import Client (Client)
import Client as Client
import Data.Array as Array
import Data.Either as Either
import Data.Maybe (Maybe(..))
import Data.Maybe as Maybe
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Record as Record

command :: Client -> Array String -> Aff Unit
command client args = do
  { arguments, options } <-
    Either.either
      (const (liftEffect (Exception.throw "invalid option")))
      pure
      (CommandLineOption.parse
        { title:
            CommandLineOption.stringOption
              "title" (Just 't') "<TITLE>" "title" ""
        }
        args)
  file <-
    Maybe.maybe
      (liftEffect (Exception.throw "no file"))
      pure
      (Array.index arguments 0)
  response <- client `Client.create` (Record.merge options { file })
  Console.log (Client.showResponse response)
