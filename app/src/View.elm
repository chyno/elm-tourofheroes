module View exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div,span, text, h4,a,p, h1, nav, h2,ul,li, label)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import RemoteData
import Routing exposing (..)

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


favoritesView : List  Hero -> Html Msg
favoritesView heroes =
  div [class "grid grid-pad"]
       (List.map favoriteView heroes)

favoriteView :  Hero -> Html Msg
favoriteView hero =
  div
  []
  [
  nav []
     [ a [class "col-1-4", href (heroPath hero.id)][text "Details"]
      , div [class "module hero"] [h4 [][ text hero.name] ]
     ]
  ]

detailView :  Hero -> Html Msg
detailView hero =
  div
  []
  [
      h2 [][text "Details View"]
      , label [][text "Name"]
      , span [] [ text hero.name]
  ]

type ListPage 
  = Favorites  |
    All 

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

heroesView : List Hero -> Html msg
heroesView heroes =
  div []
      [ h2 [] [text "Hero Details Here"],
        ul []
      ( List.map heroView heroes)
      ]

heroView  : Hero -> Html msg
heroView hero = 
 div []
      [ label [][text "Name: "]
      , span [] [text hero.name]
      ]

notFoundView : Html msg
notFoundView =
    div []
        [text "Not found"]