module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (HeroId, Route(..))
import UrlParser exposing (..)
import Debug


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map FavoritesRoute top      
         , map HeroRoute (s "heroes" </> string)
         , map HeroesRoute (s "heroes")
       
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
          Debug.log ("*** Href - " ++ location.href)
          route
        Nothing ->
            Debug.log "route not found"
            NotFoundRoute


heroesPath : String
heroesPath =
    "#heroes"

dashboardPath : String
dashboardPath =
    "#"


heroPath : HeroId -> String
heroPath id =
    "#heroes/" ++ id
