module Puzzle exposing (getClueById, parse)

import Data.Puzzle exposing (Cell(..), Clue, ClueId, Metadata, Puzzle)
import Data.Direction exposing (Direction(..))
import Data.Grid as Grid exposing (Grid)
import Data.OneOrTwo exposing (OneOrTwo(..))
import Dict exposing (Dict)
import List.Extra
import Parser exposing (..)
import Puzzle.Format.Xd


getClueById : Puzzle -> ClueId -> Maybe Clue
getClueById puzzle_ targetClueId =
    puzzle_.clues
        |> Dict.get targetClueId



parse : String -> Result (List Parser.DeadEnd) Puzzle
parse input =
    Puzzle.Format.Xd.parse input
