module Heroes.List exposing (..)
import Html.Attributes exposing (class, href)
import Html exposing (Html, div,span, text, h4,a,p, h1, nav, h2,ul,li, label)
import Models exposing (..)
import Msgs exposing (Msg)
import Routing exposing (..)


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

