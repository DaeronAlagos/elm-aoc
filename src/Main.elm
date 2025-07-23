module Main exposing (..)

import Browser exposing (Document)
import Element exposing (..)
import Html exposing (Html)
import Html.Events exposing (..)
import Element.Input exposing (button, labelHidden, multiline, placeholder)
import Element.Background as Background


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
    , input : String
    , partOne : Maybe Int
    , partTwo : Maybe Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { year = 2024
      , day = 1
      , input = ""
      , partOne = Nothing
      , partTwo = Nothing
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = YearChanged Int
    | DayChanged Int
    | InputChanged String
    | SubmitPressed


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        YearChanged year ->
            ( { model | year = year }, Cmd.none )

        DayChanged day ->
            ( { model | day = day }, Cmd.none )

        InputChanged input ->
            ({model | input = input }, Cmd.none)

        SubmitPressed ->
            (model, Cmd.none)


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
    , body = [
        layout [] (viewPageColumn model)
    ]
    }


viewPageColumn model =
    el [centerX, centerY] (column
        [ width fill
        , height fill
        , spacing 20
        ]
        [ viewPageHeading
        , multiline 
        [ width (px 500)
        , height (px 200)
        ] 
            { onChange = InputChanged
            , text = model.input
            , placeholder = Just <| placeholder [] <| text "Type your message"
            , spellcheck = False
            , label = labelHidden "Input"
            }
        , button
         [ Background.color color.lightBlue
         , padding 10
         , width (px 500)
         ] 
        { onPress = Just SubmitPressed
        , label = el [centerX] (text "Submit")
        }]
    )

viewPageHeading : Element msg
viewPageHeading =
    el [centerX, spacing 10] (text "Advent of Code with Elm")


color =
    { lightBlue = rgb255 0xC5 0xE8 0xF7
    }