module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (HeroId, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HeroesRoute top
        , map HeroRoute (s "dashboard" </> string)
        , map HeroesRoute (s "heroes")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRoute

dashboardPath : String
dashboardPath =
    "#dashboard"

heroPath : HeroId -> String
heroPath id =
    "#heroes/" ++ id
{-

playersPath : String
playersPath =
    "#players"


playerPath : PlayerId -> String
playerPath id =
    "#players/" ++ id
-}