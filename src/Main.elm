module Main exposing (..)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { year : Int
    , day : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { year = 2024
      , day = 1
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = YearChanged Int
    | DayChanged Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        YearChanged year ->
            ( { model | year = year }, Cmd.none )

        DayChanged day ->
            ( { model | day = day }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


type alias Document msg =
    { title : String
    , body : List (Html msg)
    }


view : Model -> Document Msg
view model =
    { title = "Advent of Code with Elm"
    , body =
        [ div [] [ text "Hello World" ]
        ]
    }
