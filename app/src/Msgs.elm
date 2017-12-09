module Msgs exposing (..)
import Http
import Models exposing (Hero, HeroId)
--import Models exposing (Player, PlayerId)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    =   OnFetchHeroes (WebData (List Hero))
        | OnFetchFavorites (WebData (List Hero))
        | OnFetchHero (WebData (Hero))
        | OnLocationChange Location
        | FilterHeroes String
     

