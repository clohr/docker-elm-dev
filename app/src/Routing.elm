module Routing exposing (parseLocation, homePath, Route(..), onLinkClick)

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode
import Navigation exposing (Location)
import UrlParser exposing (Parser, oneOf, map, top, s, (</>), string, parsePath)


type Route
    = HomeRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


homePath : String
homePath =
    "/"


{-|
When clicking a link we want to prevent the default browser behaviour which is to load a new page.
So we use `onWithOptions` instead of `onClick`.
-}
onLinkClick : msg -> Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
        onWithOptions "click" options (Decode.succeed message)
