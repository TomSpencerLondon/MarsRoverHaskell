module MarsRoverSpec (spec) where

import Import
import Test.Hspec
import Test.Hspec.QuickCheck

data Rover = Rover
    {
        position :: Position
    }

type Position = (Int, Int)

mkRover :: Rover
mkRover = Rover { position = (0, 0) }

spec :: Spec
spec = do
  describe "Mars Rover" $ do
    let rover = mkRover
    it "has expected initial position" $ do
        position rover `shouldBe` (0, 0)