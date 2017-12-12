module Heroes.Detail exposing (..)
import Html.Styled exposing (..)
import Models exposing (..)
import Msgs exposing (Msg)
import Html.Styled.Events exposing (onClick)

{-
<div *ngIf="hero">
	<h2>{{hero.name}} details!</h2>
	<div>
		<label>id: </label>{{hero.id}}</div>
	<div>
		<label>name: </label>
		<input [(ngModel)]="hero.name" placeholder="name"/>
	</div>
	<button (click)="goBack()">Back</button>
</div>
-}
detailView :  Hero -> Html Msg
detailView hero =
  div
  []
  [
    h2 [] [text (hero.name ++ " details!")]
    , div [] [ label [] [text "id :"] , text hero.id ]
    , div [] [ label [] [text "name:"], input [] [] ]
    , button [ onClick Msgs.GoBack ] [text "Back"]
  ]