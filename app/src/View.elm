module View exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div,span, text, h4,a,p, h1, nav, h2,ul,li, label)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import RemoteData
import Routing exposing (..)
import Heroes.List exposing (..)


view : Model -> Html Msg
view model =
    div []
        [   headerView model,
            h4 [][text "Tour of Heroes"],
            page model ]

headerView : Model -> Html Msg
headerView model =
  nav []
      [
          a [href dashboardPath][text "Dashboard"],
          a [href heroesPath][text "Heroes"]
      ]
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

-- Show correct view on  web request results concerning list of Heroes
maybeList : Model ->   Html Msg
maybeList model  =
  let
      listview  =
         case model.route of
            Models.FavoritesRoute ->
                (favoritesView model.filteredHeroes)
            Models.HeroesRoute ->
                heroesView
            _ ->
              (favoritesView model.filteredHeroes)
  in  
    case model.heroes of
        RemoteData.NotAsked ->
            text ""
        RemoteData.Loading ->
            text "Loading..."
        RemoteData.Success heroes ->
            listview heroes
        RemoteData.Failure error ->
            text (toString error)

-- Show correct view on  web request results concerning Hero detail
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
          
notFoundView : Html msg
notFoundView =
    div []
        [text "Not found"]