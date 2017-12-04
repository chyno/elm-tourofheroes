module Main exposing (..)

import Commands exposing (fetchPlayers)
import Models2 exposing (..)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import Dashboard  exposing (view)


init :  ( Model2, Cmd Msg )
init  =
  ( initialModel, Cmd.none )


subscriptions : Model2 -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model2 Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
