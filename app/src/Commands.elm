module Commands exposing (fetchHero, fetchHeroes, fetchFavorites)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode
import Msgs exposing (Msg)
import Models exposing (HeroId, Hero)
import RemoteData



fetchHero : String -> Cmd Msg
fetchHero id =
    Http.get (fetchHeroUrl id) heroDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchHero

fetchHeroes : Cmd Msg
fetchHeroes =
    Http.get fetchHeroesUrl heroesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchHeroes


fetchFavorites : Cmd Msg
fetchFavorites =
    Http.get fetchFavoritesUrl heroesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchHeroes


fetchHeroesUrl : String
fetchHeroesUrl =
    "http://localhost:4000/heroes"

fetchHeroUrl : String -> String
fetchHeroUrl id =
    "http://localhost:4000/heroes/" ++ id


fetchFavoritesUrl : String
fetchFavoritesUrl = 
  "http://localhost:4000/heroes?_start=0&_end=4"

-- DECODERS
heroesDecoder : Decode.Decoder (List Hero)
heroesDecoder =
    Decode.list heroDecoder


heroDecoder : Decode.Decoder Hero
heroDecoder =
    decode Hero
        |> required "id" Decode.string
        |> required "name" Decode.string
         