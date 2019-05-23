module Main exposing (main)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    }


init : Model
init =
    { name = "" }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Name", value model.name, onInput ChangeName ] []
        ]



-- UPDATE


type Msg
    = ChangeName String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeName newName ->
            { model | name = newName }

