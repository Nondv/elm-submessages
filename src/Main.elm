module Main exposing (main)

import Browser
import Html exposing (Attribute, Html, br, button, div, input, text, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , surname : String
    , bio : String
    }


init : Model
init =
    { name = ""
    , surname = ""
    , bio = ""
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Name", value model.name, onInput ChangeName ] []
        , br [] []
        , input [ placeholder "Surname", value model.surname, onInput ChangeSurname ] []
        , br [] []
        , textarea [ placeholder "Bio", onInput ChangeBio, value model.bio ] []
        , br [] []
        , button [ onClick Save ] [ text "Save" ]
        ]



-- UPDATE


type Msg
    = ChangeName String
    | ChangeSurname String
    | ChangeBio String
    | Save


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeName newName ->
            { model | name = newName }

        ChangeSurname newSurname ->
            { model | surname = newSurname }

        ChangeBio newBio ->
            { model | bio = newBio }

        Save ->
            { model
                | name = model.name ++ "!"
                , surname = model.surname ++ "!"
                , bio = model.bio ++ "!"
            }
