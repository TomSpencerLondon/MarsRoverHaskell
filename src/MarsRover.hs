module MarsRover (
    mkRover
    , position
) where

data Rover = Rover
    { position :: Position
    }

type Position = (Int, Int)

mkRover :: Rover
mkRover = Rover { position = (0, 0) }