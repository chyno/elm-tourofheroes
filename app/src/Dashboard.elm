module Dashboard exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Html exposing (..)
import Models exposing (..)
import RemoteData exposing (WebData)

{-<h3>Top Heroes</h3>
<div class="grid grid-pad">
  <a *ngFor="let hero of heroes" class="col-1-4">
    <div class="module hero">
      <h4>{{hero.name}}</h4>
    </div>
  </a>
</div>

-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  (model, Cmd.none)

view : Model -> Html Msg
view model =
  maybeList  model.heroes
        

herosView : List  Hero -> Html Msg
herosView heroes =
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
            herosView heroes

        RemoteData.Failure error ->
            text (toString error)