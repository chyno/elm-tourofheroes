module Update exposing (update)

import RemoteData exposing (WebData)
import Msgs exposing (Msg)
import Models exposing (..)
import Routing exposing (parseLocation)
import Commands exposing (..)



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchFavorites response ->
           ( { model | heroes = response  }, Cmd.none )
        Msgs.OnFetchHeroes response ->
            ( { model | heroes = response }, Cmd.none )
        Msgs.OnFetchHero response ->
             ( { model | selectedHero = response }, Cmd.none )
        Msgs.OnLocationChange location  ->
            let
                newRoute =
                    parseLocation location
            in
                case newRoute of
                    FavoritesRoute ->
                        ( { model | route = newRoute }, fetchFavorites )
                    HeroesRoute ->
                        ( { model | route = newRoute }, fetchHeroes )
                    HeroRoute id ->
                        ( { model | route = newRoute }, fetchHero id )
                    _ ->
                        ( { model | route = newRoute }, Cmd.none )

                
