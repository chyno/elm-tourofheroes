module View exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div, text, h4)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Routing exposing (parseLocation)
import RemoteData

view : Model -> Html Msg
view model =
    div []
        [ page model ]


heroesView : List  Hero -> Html Msg
heroesView heroes =
  div [class "grid grid-pad"]
       (List.map heroView heroes)

heroView :  Hero -> Html Msg
heroView hero =
  div [class "module hero"]
      [h4 [][ text hero.name] ]

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
            notFoundView

        Models.NotFoundRoute ->
            notFoundView



notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]