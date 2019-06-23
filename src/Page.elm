module Page exposing (Page(..), view)

import Browser exposing (Document)
import Css exposing (px, rgb)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Route exposing (Route)
import Session exposing (Session)
import Styles
import View.Logo as Logo


type Page
    = Other
    | Home
    | Game
    | About


view : Session -> Page -> { title : String, content : Html msg } -> Document msg
view session page { title, content } =
    { title = title
    , body = List.map toUnstyled [ viewHeader page, content, viewFooter ]
    }


viewHeader : Page -> Html msg
viewHeader page =
    nav
        [ css
            [ Css.displayFlex
            , Css.alignItems Css.center
            , Css.backgroundColor Styles.colors.lightGrey
            , Css.padding (px 14)
            , Styles.fonts.avenir
            ]
        ]
        [ a
            [ css
                [ Css.displayFlex
                , Css.alignItems Css.center
                , Css.paddingRight (px 20)
                , Css.textDecoration Css.none
                , Css.outline Css.zero
                , Css.color Styles.colors.black
                ]
            , Route.home
            ]
            [ div
                [ Route.home
                , css
                    [ Css.marginRight (px 14)
                    , Css.maxWidth (px 25)
                    ]
                ]
                [ Logo.view ]
            , text "Crossword Games"
            ]
        , viewHeaderLink (Route.gameForId "default") "Solo Game"
        , viewHeaderLink Route.about "About"
        ]


viewHeaderLink : Html.Styled.Attribute msg -> String -> Html msg
viewHeaderLink route string =
    a
        [ css
            [ Css.paddingRight (px 20)
            , Css.textDecoration Css.none
            , Css.outline Css.zero
            , Css.color Styles.colors.black
            ]
        , route
        ]
        [ text string ]


viewFooter : Html msg
viewFooter =
    div [] []
