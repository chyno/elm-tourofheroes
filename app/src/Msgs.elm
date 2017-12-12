module Msgs exposing (..)
import Models exposing (Hero)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    =   OnFetchHeroes (WebData (List Hero))
        | OnFetchHero (WebData (Hero))
        | OnLocationChange Location
        | FilterHeroes String
        | GoBack
     -- | OnFetchFavorites (WebData (List Hero))