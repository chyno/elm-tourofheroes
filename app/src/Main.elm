module Main exposing (..)

import Routing exposing (..)
import View exposing (view)
import Commands exposing (fetchHeroes, fetchFavorites)
import Models exposing (..)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Update exposing (update)
import Html.Styled exposing (..)

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
        , view = view  >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }
