module MarsRoverSpec (spec) where

import Import
import MarsRover
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "Mars Rover" $ do
    let rover = mkRover
    context "created instance" $ do
        it "has expected initial position" $ position rover `shouldBe` (0, 0)
        it "has expected initial facing" $ facing rover `shouldBe` North
    context "receiving single command" $ do
        context "forward" $ do
            it "moves forward one field in the direction it is facing" $ do
                commands rover "f" `shouldBe` rover { position = (0, 1) }