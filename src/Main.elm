module Main exposing (..)

import Debug exposing (log)
import Html exposing (Html, a, div, span, text, textarea)
import Html.Attributes exposing (class, readonly, type_, value, wrap)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model =
    { body : String
    }


init : ( Model, Cmd Msg )
init =
    ( { body = "わからん" }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | OnKeyPress


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnKeyPress ->
            let
                _ =
                    log "hoge"
            in
            ( { model | body = model.body ++ "あ" }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div [ class "display" ]
            [ textarea [ class "display-text", readonly True, wrap "hard", value model.body ] []
            ]
        , div [ class "keyboard" ]
            [ a [ class "return button", type_ "button" ] [ span [ class "icon is-medium" ] [ text "□" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "1 あ" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "2 か" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "3 さ" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "4 た" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "5 な" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "6 は" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "7 ま" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "8 や" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "9 ら" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "*" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "0 わ" ] ]
            , a [ class "button", type_ "button", onClick OnKeyPress ] [ span [ class "icon" ] [ text "#" ] ]
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
