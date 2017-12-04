module Models2 exposing (..)


type alias Model2 =
    { heroes : List Hero
    }


initialModel :  Model2
initialModel  =
    { heroes = [{id = "1", name = "foo"}]
    }


type alias HeroId =
    String


type alias Hero =
    { id : HeroId
    , name : String
    }