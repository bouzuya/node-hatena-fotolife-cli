module Command
  ( Command
  , description
  , exec
  , fromString
  , name
  ) where

import Prelude

import Client (Client)
import Command.Delete as CommandDelete
import Command.Info as CommandInfo
import Command.List as CommandList
import Command.Update as CommandUpdate
import Command.Upload as CommandUpload
import Data.Array as Array
import Data.Enum (class BoundedEnum, class Enum)
import Data.Enum as Enum
import Data.Foldable as Foldable
import Data.Maybe (Maybe)
import Data.Maybe as Maybe
import Effect.Aff (Aff)
import Partial.Unsafe as Unsafe

data Command =
  Command String String (Client -> Array String -> Aff Unit)

instance boundedCommand :: Bounded Command where
  bottom = Unsafe.unsafePartial (Maybe.fromJust (Array.head commands))
  top  = Unsafe.unsafePartial (Maybe.fromJust (Array.last commands))

instance boundedEnumCommand :: BoundedEnum Command where
  cardinality = Enum.Cardinality (Array.length commands)
  fromEnum a =
    Unsafe.unsafePartial (Maybe.fromJust (Array.findIndex (eq a) commands))
  toEnum = Array.index commands

instance enumCommand :: Enum Command where
  pred = Enum.toEnum <<< (_ - 1) <<< Enum.fromEnum
  succ = Enum.toEnum <<< (_ + 1) <<< Enum.fromEnum

instance eqCommand :: Eq Command where
  eq (Command a _ _) (Command b _ _) = eq a b

instance ordCommand :: Ord Command where
  compare = comparing Enum.fromEnum

instance showCommand :: Show Command where
  show (Command n _ _) = "(Command " <> n <> ")"

commands :: Array Command
commands =
  Array.sortWith
    name
    [ Command "delete" "delete a photo" CommandDelete.command
    , Command "info" "view a photo info" CommandInfo.command
    , Command "list" "list uploaded photos" CommandList.command
    , Command "update" "update a photo info" CommandUpdate.command
    , Command "upload" "upload a photo" CommandUpload.command
    ]

description :: Command -> String
description (Command _ d _) = d

exec :: Command -> Client -> Array String -> Aff Unit
exec (Command _ _ f) = f

fromString :: String -> Maybe Command
fromString s = Foldable.find ((eq s) <<< name) commands

name :: Command -> String
name (Command n _ _) = n
