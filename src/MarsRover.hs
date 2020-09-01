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

data Facing =
    North | West
    deriving (Show, Eq)

type Position = (Int, Int)

mkRover :: Rover
mkRover = Rover { position = (0, 0), facing = North }

commands :: Rover -> String -> Rover
commands rover [] = rover
commands rover (x:xs) = command x rover

command :: Char -> Rover -> Rover
command 'f' = forward

forward :: Rover -> Rover
forward rover@Rover{..} = rover { position = newPosition position facing}
    where
        newPosition (x, y) North = (0, 1)
        newPosition (x, y) West = (1, 0)