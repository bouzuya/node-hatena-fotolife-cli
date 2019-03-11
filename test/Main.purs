module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Test.Command as Command
import Test.Unit.Main as TestUnitMain

main :: Effect Unit
main = TestUnitMain.runTest do
  Command.tests
