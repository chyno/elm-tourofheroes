module Update exposing (update)

import RemoteData exposing (WebData)
import Msgs exposing (Msg)
import Models exposing (..)
import Routing exposing (parseLocation)
import Commands exposing (..)


filterHeroes : List Hero -> String -> List Hero
filterHeroes allHeroes fltStr =
    if (String.length fltStr) < 1 then
        []
    else
        List.filter (\item -> String.contains fltStr item.name) allHeroes
        
 
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.FilterHeroes flt ->
            case model.heroes of
                RemoteData.Success heroes ->
                    ( { model | filteredHeroes = (filterHeroes heroes flt) }, Cmd.none )  
                _ ->
                    (model, Cmd.none )          
     --   Msgs.OnFetchFavorites response ->
     --      ( { model | heroes = response  }, Cmd.none )
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
                        ( { model | route = newRoute }, fetchHeroes )
                    HeroesRoute ->
                        ( { model | route = newRoute }, fetchHeroes )
                    HeroRoute id ->
                        ( { model | route = newRoute }, fetchHero id )
                    _ ->
                        ( { model | route = newRoute }, fetchHeroes )
                        
        Msgs.GoBack ->
             ( { model | route = HeroesRoute }, fetchHeroes )    
                
