module Heroes.List exposing (..)
import Html.Styled.Attributes exposing (class, href,id, placeholder, title  )
import Html.Styled.Events exposing (onInput)
import Html.Styled exposing (..)
import Models exposing (..)
import Msgs exposing (Msg)
import Routing exposing (..)
import RemoteData exposing (WebData)
import RemoteData

-- Fovrotes views
favoritesView : List Hero -> List  Hero -> Html Msg
favoritesView filteredHeroes heroes =
  div []
      [
        h3  [] 
            [ text "Top Heroes"],
        div [ class "grid grid-pad"]
            (List.map favoriteView heroes)
            , heroesSearchView filteredHeroes
      ]

favoriteView :  Hero -> Html Msg
favoriteView hero =
  div []
  [
    nav []
        [ a [ class "col-1-4"
              , href (heroPath hero.id)]
            [text "Details"] 
        , div [class "module hero"] 
              [h4 [][ text hero.name]]
        ]
  ]
-- *************************************************

-- Heroes views
heroDetailView : Hero -> Html Msg
heroDetailView hero =
  li []
      [
        a [href ("#/heroes/" ++ hero.id)]
        [ span [class "badge"] [ (text hero.id)]
          , text hero.name   
        ]
        , button [class "delete", title "delete hero" ] [text "x"]
      ]
  

heroesView : List Hero -> Html Msg
heroesView heroes = 
    div []
        [ h2 [] [text "My Heroes"]
          , div []
              [ label []
                      [ 
                        text "Hero Name"
                        , input [] []
                        , button [] [text "Add"]
                      ]
              ]
          , ul [class "heroes"] (List.map heroDetailView heroes)
        ]
-- *****************************************************
{--

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
--}

heroesSearchView : List Hero  -> Html  Msg
heroesSearchView heroes = 
  div [id "search-component"]
      [
        h4 [][text "Hero Search"]
        , input [id "search-box", placeholder "Filter Heroes", onInput Msgs.FilterHeroes] []
        , ul [ class "search-result"]
             (List.map heroSearchView heroes)       
      ]

heroSearchView : Hero -> Html Msg
heroSearchView hero =
  li [] 
     [
       a [href  ("/detail/" ++ hero.id) ][text hero.name]
     ]


