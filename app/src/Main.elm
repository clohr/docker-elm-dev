module Main exposing (..)

import Html exposing (Html, text, div, program)
import Routing exposing (parseLocation, Route(..))
import Navigation exposing (Location)


-- MODEL


type alias Model =
    { route : Route
    }


initialModel : Route -> Model
initialModel route =
    { route = route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )



-- UPDATE


type Msg
    = ChangeLocation String
    | OnLocationChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLocation path ->
            ( model, Navigation.newUrl path )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            homeView

        NotFoundRoute ->
            notFoundView


homeView : Html msg
homeView =
    div []
        [ text "Home"
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
