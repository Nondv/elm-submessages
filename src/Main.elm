module Main exposing (main)

import Browser
import Html exposing (Attribute, Html, br, button, div, h3, input, text, textarea)
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
    , dogName : String
    , breed : String
    , dogBio : String
    }


init : Model
init =
    { name = ""
    , surname = ""
    , bio = ""
    , dogName = ""
    , breed = ""
    , dogBio = ""
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Hooman" ]
        , input [ placeholder "Name", value model.name, onInput ChangeName ] []
        , br [] []
        , input [ placeholder "Surname", value model.surname, onInput ChangeSurname ] []
        , br [] []
        , textarea [ placeholder "Bio", onInput ChangeBio, value model.bio ] []
        , br [] []
        , button [ onClick Save ] [ text "Save" ]
        , h3 [] [ text "Doggo" ]
        , input [ placeholder "Name", value model.dogName, onInput ChangeDogName ] []
        , br [] []
        , input [ placeholder "Breed", value model.breed, onInput ChangeBreed ] []
        , br [] []
        , textarea [ placeholder "Bio", onInput ChangeDogBio, value model.dogBio ] []
        , br [] []
        , button [ onClick SaveDog ] [ text "Save" ]
        ]



-- UPDATE


type Msg
    = ChangeName String
    | ChangeSurname String
    | ChangeBio String
    | Save
    | ChangeDogName String
    | ChangeBreed String
    | ChangeDogBio String
    | SaveDog


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

        ChangeDogName newName ->
            { model | dogName = newName }

        ChangeBreed newBreed ->
            { model | breed = newBreed }

        ChangeDogBio newBio ->
            { model | dogBio = newBio }

        SaveDog ->
            { model
                | dogName = model.dogName ++ " Woof!"
                , breed = model.breed ++ " Woof!"
                , dogBio = model.dogBio ++ " Woof!"
            }
