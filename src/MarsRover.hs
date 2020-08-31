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
    North deriving (Show, Eq)

type Position = (Int, Int)

mkRover :: Rover
mkRover = Rover { position = (0, 0), facing = North }

commands :: Rover -> String -> Rover
commands rover [] = rover
commands rover list = rover { position = (0, 1) }