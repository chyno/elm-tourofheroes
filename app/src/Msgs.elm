module Msgs exposing (..)
import Http
import Models exposing (Hero, HeroId)
--import Models exposing (Player, PlayerId)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchHeroes (WebData (List Hero))
    | OnLocationChange Location
    --OnFetchPlayers (WebData (List Player))
   -- 
   ---- | ChangeLevel Player Int
   -- | OnPlayerSave (Result Http.Error Player)
