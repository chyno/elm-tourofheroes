module Models exposing (..)
import RemoteData exposing (WebData)

{-
type LoadingPage 
  = Favorites  |
    All 
 -}
    
type alias Model =
    { heroes :  WebData (List Hero)
    , route : Route
    , selectedHero : WebData (Hero)
    , filteredHeroes : List Hero
    }


type alias HeroId =
    String

type alias FavoriteQuery =
    String


type alias Hero =
    { id : HeroId
    , name : String
    }

    
initialModel : Route -> Model
initialModel route =
    { heroes = RemoteData.Loading
    , route = route
    , selectedHero = RemoteData.NotAsked
    , filteredHeroes = []
    }


type Route
    = FavoritesRoute 
    | HeroesRoute
    | HeroRoute HeroId
    | NotFoundRoute