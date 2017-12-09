module View exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div,span, text, h4,a,p, h1, nav, h2,ul,li, label)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import RemoteData
import Routing exposing (..)
import Heroes.List exposing (..)

headerView : Model -> Html Msg
headerView model =
  nav []
      [
          a [href dashboardPath][text "Dashboard"],
          a [href heroesPath][text "Heroes"]
      ]

view : Model -> Html Msg
view model =
    div []
        [   headerView model,
            h4 [][text "John Heroes"],
            page model ]



maybeList : Model ->   Html Msg
maybeList model  =
  let
      response = model.heroes
      v  =
         case model.route of
            Models.FavoritesRoute ->
                favoritesView
            Models.HeroesRoute ->
                heroesView
            _ ->
              favoritesView
  in  
    case response of
        RemoteData.NotAsked ->
            text ""
        RemoteData.Loading ->
            text "Loading..."
        RemoteData.Success heroes ->
            v heroes
        RemoteData.Failure error ->
            text (toString error)


maybeDetail : WebData (Hero) ->   Html Msg
maybeDetail response  =
    case response of
        RemoteData.NotAsked ->
            text "Not asked..."
        RemoteData.Loading ->
            text "Loading..."
        RemoteData.Success hero ->
          detailView hero
        RemoteData.Failure error ->
            text (toString error)

page : Model -> Html Msg
page model =
    case model.route of
        Models.FavoritesRoute ->
          maybeList model
        Models.HeroesRoute ->
          maybeList model
        Models.HeroRoute id ->
          maybeDetail model.selectedHero
        Models.NotFoundRoute ->
          notFoundView
          
notFoundView : Html msg
notFoundView =
    div []
        [text "Not found"]