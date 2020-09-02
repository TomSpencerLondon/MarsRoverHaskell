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
    context "standing still" $
        it "does nothing when no commands are received" $
            commands rover "" `shouldBe` rover
    context "receiving single command" $ do
        context "forward" $ do
            it "moves forward one field in the direction it is facing" $ do
                commands rover "f" `shouldBe` rover { position = (0, 1) }
                commands rover {position = (21, 43)} "f" `shouldBe` rover {position = (21, 44)}
                commands rover{facing = West} "f" `shouldBe` rover { position = (1, 0), facing = West }
                commands rover{position = (1, 2), facing = West} "f" `shouldBe` rover { position = (2, 2), facing = West }
                commands rover{position = (1, 2), facing = South} "f" `shouldBe` rover { position = (1, 1), facing = South }
                commands rover{position = (1, 2), facing = East} "f" `shouldBe` rover { position = (0, 2), facing = East }
        context "left" $
            it "turns left by 90 degrees" $ do
                commands rover "l" `shouldBe` rover {facing = West}
                commands rover {facing = West} "l" `shouldBe` rover {facing = South}
                commands rover {facing = South} "l" `shouldBe` rover {facing = East}
                commands rover {facing = East} "l" `shouldBe` rover {facing = North}