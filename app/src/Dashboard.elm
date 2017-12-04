module Dashboard exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Html exposing (..)
import Models2 exposing (..)
{-<h3>Top Heroes</h3>
<div class="grid grid-pad">
  <a *ngFor="let hero of heroes" class="col-1-4">
    <div class="module hero">
      <h4>{{hero.name}}</h4>
    </div>
  </a>
</div>

-}
update : Msg -> Model2 -> ( Model2, Cmd Msg )
update msg model =
  (model, Cmd.none)

view : Model2 -> Html Msg
view model =
  div [class "grid grid-pad"]
        (List.map heroView model.heroes)
        

heroView : Hero -> Html Msg
heroView hero =
  div [class "module hero"]
      [h4 [][ text hero.name] ]