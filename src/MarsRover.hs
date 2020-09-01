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
commands rover (x:xs) = command x rover

command :: Char -> Rover -> Rover
command 'f' rover = forward rover

forward :: Rover -> Rover
forward rover = rover { position = (0, 1) }