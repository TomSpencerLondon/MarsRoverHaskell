module MarsRoverSpec (spec) where

import Import
import MarsRover
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "Mars Rover" $ do
    let rover = mkRover
    it "has expected initial position" $ do
        position rover `shouldBe` (0, 0)