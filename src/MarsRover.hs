{-# LANGUAGE RecordWildCards #-}

module MarsRover (
    mkRover
    , commands
    , position
    , facing
    , Facing (..)
) where

data Rover = Rover
    { position :: Position
    , facing :: Facing
    } deriving (Show, Eq)

data Facing
    = North
    | West
    | South
    | East
    deriving (Show, Eq)

type Position = (Int, Int)

mkRover :: Rover
mkRover = Rover { position = (0, 0), facing = North }

commands :: Rover -> String -> Rover
commands rover [] = rover
commands rover (x:xs) = command x rover

command :: Char -> Rover -> Rover
command 'f' = forward
command 'l' = turnLeft

forward :: Rover -> Rover
forward rover@Rover{..} = rover { position = newPosition position facing}
    where
        newPosition (x, y) North = (x, y+1)
        newPosition (x, y) South = (x, y - 1)
        newPosition (x, y) West = (x + 1, y)
        newPosition (x, y) East = (x - 1, y)

turnLeft :: Rover -> Rover
turnLeft rover@Rover{..} = rover {facing = newFacing facing }
    where
        newFacing North = West
        newFacing West = South