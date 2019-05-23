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
        , input [ placeholder "Name", value model.name, onInput (HoomanEvent << ChangeHoomanName) ] []
        , br [] []
        , input [ placeholder "Surname", value model.surname, onInput (HoomanEvent << ChangeHoomanSurname) ] []
        , br [] []
        , textarea [ placeholder "Bio", onInput (HoomanEvent << ChangeHoomanBio), value model.bio ] []
        , br [] []
        , button [ onClick (HoomanEvent SaveHooman) ] [ text "Save" ]
        , h3 [] [ text "Doggo" ]
        , input [ placeholder "Name", value model.dogName, onInput (DoggoEvent << ChangeDogName) ] []
        , br [] []
        , input [ placeholder "Breed", value model.breed, onInput (DoggoEvent << ChangeDogBreed) ] []
        , br [] []
        , textarea [ placeholder "Bio", onInput (DoggoEvent << ChangeDogBio), value model.dogBio ] []
        , br [] []
        , button [ onClick (DoggoEvent SaveDog) ] [ text "Save" ]
        ]



-- UPDATE


type Msg
    = HoomanEvent HoomanMsg
    | DoggoEvent DoggoMsg


type HoomanMsg
    = ChangeHoomanName String
    | ChangeHoomanSurname String
    | ChangeHoomanBio String
    | SaveHooman


type DoggoMsg
    = ChangeDogName String
    | ChangeDogBreed String
    | ChangeDogBio String
    | SaveDog


update : Msg -> Model -> Model
update msg model =
    case msg of
        HoomanEvent hoomanMsg ->
            updateHooman hoomanMsg model

        DoggoEvent doggoMsg ->
            updateDoggo doggoMsg model


updateHooman : HoomanMsg -> Model -> Model
updateHooman msg model =
    case msg of
        ChangeHoomanName newName ->
            { model | name = newName }

        ChangeHoomanSurname newSurname ->
            { model | surname = newSurname }

        ChangeHoomanBio newBio ->
            { model | bio = newBio }

        SaveHooman ->
            { model
                | name = model.name ++ "!"
                , surname = model.surname ++ "!"
                , bio = model.bio ++ "!"
            }


updateDoggo : DoggoMsg -> Model -> Model
updateDoggo msg model =
    case msg of
        ChangeDogName newName ->
            { model | dogName = newName }

        ChangeDogBreed newBreed ->
            { model | breed = newBreed }

        ChangeDogBio newBio ->
            { model | dogBio = newBio }

        SaveDog ->
            { model
                | dogName = model.dogName ++ " Woof!"
                , breed = model.breed ++ " Woof!"
                , dogBio = model.dogBio ++ " Woof!"
            }
