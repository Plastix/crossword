module Route exposing (Route(..), fromUrl, gameForId, root)

import Html.Styled as Html
import Html.Styled.Attributes exposing (href)
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)


type Route
    = Root
    | Game String


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Root Parser.top
        , Parser.map Game (s "game" </> string)
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser


toParts : Route -> List String
toParts route =
    case route of
        Root ->
            []

        Game string ->
            [ "game", string ]


toHref : Route -> Html.Attribute msg
toHref route =
    let
        parts =
            toParts route
    in
    href ("#/" ++ String.join "/" parts)


gameForId : String -> Html.Attribute msg
gameForId id =
    toHref (Game id)


root : Html.Attribute msg
root =
    toHref Root
