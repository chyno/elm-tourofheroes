module Main exposing (..)


import Commands exposing (fetchHeroes)
import Models exposing (..)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Routing
import Dashboard  exposing (view, update)

init : Location ->  ( Model, Cmd Msg )
init location =
   let
        currentRoute =
            Routing.parseLocation location
    in
        ( (initialModel currentRoute), fetchHeroes )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN
main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }