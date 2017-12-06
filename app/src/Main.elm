module Main exposing (..)

import Routing exposing (..)
import View exposing (view)
--import Update exposing(update)
import Commands exposing (fetchHeroes)
import Models exposing (..)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Dashboard exposing (update)

--import Elemement exposing (..)
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