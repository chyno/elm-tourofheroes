module View exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div, text, h4,a,p, h1, nav)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import RemoteData
import Routing exposing (..)
headerView : Model -> Html Msg
headerView model =
  nav []
      [
          a [href heroesPath][text "Dashboard"]
      ]

view : Model -> Html Msg
view model =
    div []
        [   headerView model,
            h4 [][text "Top Heroes"],
            page model ]


heroesView : List  Hero -> Html Msg
heroesView heroes =
  div [class "grid grid-pad"]
       (List.map heroView heroes)

heroView :  Hero -> Html Msg
heroView hero =
  div
  []
  [
  nav []
     [ a [class "col-1-4", href (heroPath hero.id)][text "Deatals"]
      , div [class "module hero"] [h4 [][ text hero.name] ]
     ]
  ]


maybeList : WebData (List Hero) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success heroes ->
            (heroesView heroes)

        RemoteData.Failure error ->
            text (toString error)


page : Model -> Html Msg
page model =
    case model.route of
        Models.HeroesRoute ->
          maybeList model.heroes
        Models.HeroRoute id ->
            heroDetailView

        Models.NotFoundRoute ->
            notFoundView



heroDetailView : Html msg
heroDetailView =
    div []
        [ text "Hero Details Here"
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]