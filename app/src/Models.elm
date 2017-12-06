module Models exposing (..)
import RemoteData exposing (WebData)

type alias Model =
    { heroes :  WebData (List Hero)
    , route : Route
    }


type alias HeroId =
    String


type alias Hero =
    { id : HeroId
    , name : String
    }

    
initialModel : Route -> Model
initialModel route =
    { heroes = RemoteData.Loading
    , route = route
    }


type Route
    = HeroesRoute
    | HeroRoute HeroId
    | NotFoundRoute

{-
import RemoteData exposing (WebData)


type alias Model =
    { players : WebData (List Player)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { players = RemoteData.Loading
    , route = route
    }


type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }


type Route
    = PlayersRoute
    | PlayerRoute PlayerId
    | NotFoundRoute
-}