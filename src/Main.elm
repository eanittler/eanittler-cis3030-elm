{-
  Programming Languages Project - Elm
  Elizabeth Nittler
  May 10, 2023
-}


module Main exposing (..)


import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes as HAtt exposing (..)
import Svg exposing (..)
import Svg.Attributes as Att exposing (..)
import Random
import String exposing (concat, fromInt, toInt, fromFloat)
import List exposing(map, head)
import Maybe exposing(withDefault)



-- MAIN

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL

{-
    I started exploring the use of type alias to store my shapes.  
    I was hoping this would simplify and eliminate some of my repetitive code, 
    and it does seem to do that within the Model type, but has 
    the opposite effect in the Update and Init functions.
    It might offer slight improvment to the readability.
    So while I did some refactoring to use Circle, I'm still holding out to see 
    if I can find a better solution before continuing to refactor the rest of my code. 
-}
type alias Circle =
  { cx : String
  , cy : String
  , radius : String
  , ccolor : String
  }

-- Currently not in use.  Awaiting possible code refactoring.
type alias Rectangle =
  { x : String
  , y : String
  , width : String
  , height : String
  , color : String
  }

-- Currently not in use.  Awaiting possible code refactoring.
type alias Triangle =
  { x1 : String
  , y1 : String
  , x2 : String
  , y2 : String
  , x3 : String
  , y3 : String
  , tcolor : String
  }

type alias Model =
  { 
  -- Rectangle

    positionX : String
  , positionY : String
  , width : String
  , height : String
  , color : String

  , positionX2 : String
  , positionY2 : String
  , width2 : String
  , height2 : String
  , color2 : String

  , positionX3 : String
  , positionY3 : String
  , width3 : String
  , height3 : String
  , color3 : String

  , positionX4 : String
  , positionY4 : String
  , width4 : String
  , height4 : String
  , color4 : String

  -- Circle

  , circle1 : Circle
  , circle2 : Circle

  , cx3 : String
  , cy3 : String
  , radius3 : String
  , ccolor3 : String

  -- Triangle

  , p1x : String
  , p1y : String
  , p2x : String
  , p2y : String
  , p3x : String
  , p3y : String
  , tcolor : String

  , p1x2 : String
  , p1y2 : String
  , p2x2 : String
  , p2y2 : String
  , p3x2 : String
  , p3y2 : String
  , tcolor2 : String
  }


init : () -> (Model, Cmd Msg)
init _ =  
    let 
      model = 
        { 
        -- Rectangles

          positionX = ""
        , positionY = ""
        , width = ""
        , height = ""
        , color = ""

        , positionX2 = ""
        , positionY2 = ""
        , width2 = ""
        , height2 = ""
        , color2 = ""

        , positionX3 = ""
        , positionY3 = ""
        , width3 = ""
        , height3 = ""
        , color3 = ""

        , positionX4 = ""
        , positionY4 = ""
        , width4 = ""
        , height4 = ""
        , color4 = ""

        -- Circle

        , circle1 = Circle ("")("")("")("")
        , circle2 = Circle ("")("")("")("")

        , cx3 = ""
        , cy3 = ""
        , radius3 = ""
        , ccolor3 = ""

        -- Triangle

        , p1x = ""
        , p1y = ""
        , p2x = ""
        , p2y = ""
        , p3x = ""
        , p3y = ""
        , tcolor = ""

        , p1x2 = ""
        , p1y2 = ""
        , p2x2 = ""
        , p2y2 = ""
        , p3x2 = ""
        , p3y2 = ""
        , tcolor2 = ""

        }
    in (model, Cmd.none)

-- Contents of Model before switching over to a record to include the Circle type.  
-- Model "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
  


-- UPDATE

type Msg 
    = PositionX String
    | PositionY String
    | Width String
    | Height String
    | Color String

    | PositionX2 String
    | PositionY2 String
    | Width2 String
    | Height2 String
    | Color2 String

    | PositionX3 String
    | PositionY3 String
    | Width3 String
    | Height3 String
    | Color3 String

    | PositionX4 String
    | PositionY4 String
    | Width4 String
    | Height4 String
    | Color4 String

    -- Circle
    | CX String
    | CY String
    | Radius String
    | CColor String

    | CX2 String
    | CY2 String
    | Radius2 String
    | CColor2 String

    | CX3 String
    | CY3 String
    | Radius3 String
    | CColor3 String

    -- Triangle
    | P1X String
    | P1Y String
    | P2X String
    | P2Y String
    | P3X String
    | P3Y String
    | TColor String

    | P1X2 String
    | P1Y2 String
    | P2X2 String
    | P2Y2 String
    | P3X2 String
    | P3Y2 String
    | TColor2 String

    -- Random
    | RandomPositionX
    | RandPositionX Int
    | RandomPositionY
    | RandPositionY Int
    | RandomWidth
    | RandWidth Int
    | RandomHeight
    | RandHeight Int

    | RandomCX
    | RandCX Int
    | RandomCY
    | RandCY Int
    | RandomR
    | RandR Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        -- Rectangles

        PositionX positionX ->
          ({ model | positionX = positionX }, Cmd.none)
        PositionY positionY ->
          ({ model | positionY = positionY }, Cmd.none)
        Width width ->
          ({ model | width = width }, Cmd.none)
        Height height ->
          ({ model | height = height }, Cmd.none)
        Color color ->
          ({ model | color = color }, Cmd.none)

        PositionX2 positionX2 ->
          ({ model | positionX2 = positionX2 }, Cmd.none)
        PositionY2 positionY2 ->
          ({ model | positionY2 = positionY2 }, Cmd.none)
        Width2 width2 ->
          ({ model | width2 = width2 }, Cmd.none)
        Height2 height2 ->
          ({ model | height2 = height2 }, Cmd.none)
        Color2 color2 ->
          ({ model | color2 = color2 }, Cmd.none)

        PositionX3 positionX3 ->
          ({ model | positionX3 = positionX3 }, Cmd.none)
        PositionY3 positionY3 ->
          ({ model | positionY3 = positionY3 }, Cmd.none)
        Width3 width3 ->
          ({ model | width3 = width3 }, Cmd.none)
        Height3 height3 ->
          ({ model | height3 = height3 }, Cmd.none)
        Color3 color3 ->
          ({ model | color3 = color3 }, Cmd.none)

        PositionX4 positionX4 ->
          ({ model | positionX4 = positionX4 }, Cmd.none)
        PositionY4 positionY4 ->
          ({ model | positionY4 = positionY4 }, Cmd.none)
        Width4 width4 ->
          ({ model | width4 = width4 }, Cmd.none)
        Height4 height4 ->
          ({ model | height4 = height4 }, Cmd.none)
        Color4 color4 ->
          ({ model | color4 = color4 }, Cmd.none)

        -- Circles

        CX cx ->
          --({ model | circle1 = cx }, Cmd.none)
          ({ model | circle1 = Circle (cx)
                                      (model.circle1.cy)
                                      (model.circle1.radius)
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )
        CY cy ->
          --({ model | circle1 = cy }, Cmd.none)
          ({ model | circle1 = Circle (model.circle1.cx)
                                      (cy)
                                      (model.circle1.radius)
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )
        Radius radius ->
          --({ model | circle1 = radius }, Cmd.none)
          ({ model | circle1 = Circle (model.circle1.cx)
                                      (model.circle1.cy)
                                      (radius)
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )
        CColor ccolor ->
          --({ model | circle1 = color }, Cmd.none)
          ({ model | circle1 = Circle (model.circle1.cx)
                                      (model.circle1.cy)
                                      (model.circle1.radius)
                                      (ccolor)
                  }
                  , Cmd.none
          )

        CX2 cx2 ->
          --({ model | cx2 = cx2 }, Cmd.none)
          ({ model | circle2 = Circle (cx2)
                                      (model.circle2.cy)
                                      (model.circle2.radius)
                                      (model.circle2.ccolor)
                  }
                  , Cmd.none
          )
        CY2 cy2 ->
          --({ model | cy2 = cy2 }, Cmd.none)
          ({ model | circle2 = Circle (model.circle2.cx)
                                      (cy2)
                                      (model.circle2.radius)
                                      (model.circle2.ccolor)
                  }
                  , Cmd.none
          )
        Radius2 radius2 ->
          --({ model | radius2 = radius2 }, Cmd.none)
          ({ model | circle2 = Circle (model.circle2.cx)
                                      (model.circle2.cy)
                                      (radius2)
                                      (model.circle2.ccolor)
                  }
                  , Cmd.none
          )
        CColor2 ccolor2 ->
          --({ model | ccolor2 = ccolor2 }, Cmd.none)
          ({ model | circle2 = Circle (model.circle2.cx)
                                      (model.circle2.cy)
                                      (model.circle2.radius)
                                      (ccolor2)
                  }
                  , Cmd.none
          )

        CX3 cx3 ->
          ({ model | cx3 = cx3 }, Cmd.none)
        CY3 cy3 ->
          ({ model | cy3 = cy3 }, Cmd.none)
        Radius3 radius3 ->
          ({ model | radius3 = radius3 }, Cmd.none)
        CColor3 ccolor3 ->
          ({ model | ccolor3 = ccolor3 }, Cmd.none)

        -- Triangles

        P1X p1x ->
          ({ model | p1x = p1x }, Cmd.none)
        P1Y p1y ->
          ({ model | p1y = p1y }, Cmd.none)
        P2X p2x ->
          ({ model | p2x = p2x }, Cmd.none)          
        P2Y p2y ->
          ({ model | p2y = p2y }, Cmd.none)
        P3X p3x ->
          ({ model | p3x = p3x }, Cmd.none)
        P3Y p3y ->
          ({ model | p3y = p3y }, Cmd.none)
        TColor tcolor ->
          ({ model | tcolor = tcolor }, Cmd.none)

        P1X2 p1x2 ->
          ({ model | p1x2 = p1x2 }, Cmd.none)
        P1Y2 p1y2 ->
          ({ model | p1y2 = p1y2 }, Cmd.none)
        P2X2 p2x2 ->
          ({ model | p2x2 = p2x2 }, Cmd.none)          
        P2Y2 p2y2 ->
          ({ model | p2y2 = p2y2 }, Cmd.none)
        P3X2 p3x2 ->
          ({ model | p3x2 = p3x2 }, Cmd.none)
        P3Y2 p3y2 ->
          ({ model | p3y2 = p3y2 }, Cmd.none)
        TColor2 tcolor2 ->
          ({ model | tcolor2 = tcolor2 }, Cmd.none)

        -- Random
        RandomPositionX ->
          ( model,  Random.generate RandPositionX randomNum)
        RandPositionX randPositionX ->
          ({ model | positionX = (String.fromInt randPositionX)}, Cmd.none)
        RandomPositionY ->
          ( model,  Random.generate RandPositionY randomNum)
        RandPositionY randPositionY ->
          ({ model | positionY = (String.fromInt randPositionY)}, Cmd.none)
        RandomWidth ->
          ( model,  Random.generate RandWidth randomNum)
        RandWidth randWidth ->
          ({ model | width = (String.fromInt (abs randWidth))}, Cmd.none)
        RandomHeight ->
          ( model,  Random.generate RandHeight randomNum)
        RandHeight randHeight ->
          ({ model | height = (String.fromInt (abs randHeight))}, Cmd.none)
        
        RandomCX ->
          ( model,  Random.generate RandCX randomNum)
        RandCX randCX ->
          ({ model | circle1 = Circle (String.fromInt randCX)
                                      (model.circle1.cy)
                                      (model.circle1.radius)
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )
        RandomCY ->
          ( model,  Random.generate RandCY randomNum)
        RandCY randCY ->
          --({ model | circle1 = (String.fromInt randCY)}, Cmd.none)
          ({ model | circle1 = Circle (model.circle1.cx)
                                      (String.fromInt randCY)
                                      (model.circle1.radius)
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )
        RandomR ->
          ( model,  Random.generate RandR randomNum)
        RandR randR ->
          --({ model | circle1 = (String.fromInt (abs randR))}, Cmd.none)
          ({ model | circle1 = Circle (model.circle1.cx)
                                      (model.circle1.cy)
                                      (String.fromInt (abs randR))
                                      (model.circle1.ccolor)
                  }
                  , Cmd.none
          )


-- Generates a random number between -100 and 1000.
randomNum : Random.Generator Int
randomNum = 
  Random.int -100 1000



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW

view : Model -> Html Msg
view model =
    div []
      [ h2 [ HAtt.style "padding" "0.5em"][ Html.text "Generate Shapes!"]
      , div [HAtt.style "background-color" "black", HAtt.style "width" "100%", HAtt.style "height" "10px"] []
      , div [] 
        [   h4 [HAtt.style "padding-left" "10px"] [Html.text "Rectangle:"]
          , label [HAtt.for "pX", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "pX" model.positionX PositionX
          , label [HAtt.for "pY", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "pY" model.positionY PositionY
          , label [HAtt.for "wid", HAtt.style "padding" "10px"] [Html.text "Width:"]
          , viewInput "number" "" "wid" model.width Width
          , label [HAtt.for "heig", HAtt.style "padding" "10px"] [Html.text "Height:"]
          , viewInput "number" "" "heig" model.height Height
          , label [HAtt.for "col", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "col" model.color Color
          , button [onClick RandomPositionX, HAtt.style "margin-left" "10px"][Html.text "X"]
          , button [onClick RandomPositionY, HAtt.style "margin-left" "10px"][Html.text "Y"]
          , button [onClick RandomWidth, HAtt.style "margin-left" "10px"][Html.text "W"]
          , button [onClick RandomHeight, HAtt.style "margin-left" "10px"][Html.text "H"]
          , br [] []
          , label [HAtt.for "pX2", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "pX2" model.positionX2 PositionX2
          , label [HAtt.for "pY2", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "pY2" model.positionY2 PositionY2
          , label [HAtt.for "wid2", HAtt.style "padding" "10px"] [Html.text "Width:"]
          , viewInput "number" "" "wid2" model.width2 Width2
          , label [HAtt.for "heig2", HAtt.style "padding" "10px"] [Html.text "Height:"]
          , viewInput "number" "" "heig2" model.height2 Height2
          , label [HAtt.for "col2", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "col2" model.color2 Color2
          , br [] []
          , label [HAtt.for "pX3", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "pX3" model.positionX3 PositionX3
          , label [HAtt.for "pY3", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "pY3" model.positionY3 PositionY3
          , label [HAtt.for "wid3", HAtt.style "padding" "10px"] [Html.text "Width:"]
          , viewInput "number" "" "wid3" model.width3 Width3
          , label [HAtt.for "heig3", HAtt.style "padding" "10px"] [Html.text "Height:"]
          , viewInput "number" "" "heig3" model.height3 Height3
          , label [HAtt.for "col3", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "col3" model.color3 Color3
          , br [] []
          , label [HAtt.for "pX4", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "pX4" model.positionX4 PositionX4
          , label [HAtt.for "pY4", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "pY4" model.positionY4 PositionY4
          , label [HAtt.for "wid4", HAtt.style "padding" "10px"] [Html.text "Width:"]
          , viewInput "number" "" "wid4" model.width4 Width4
          , label [HAtt.for "heig4", HAtt.style "padding" "10px"] [Html.text "Height:"]
          , viewInput "number" "" "heig4" model.height4 Height4
          , label [HAtt.for "col4", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "col4" model.color4 Color4
        ]
        , div [] 
        [   h4 [HAtt.style "padding-left" "10px"] [Html.text "Circle:"]
          , label [HAtt.for "cX", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "cX" model.circle1.cx CX
          , label [HAtt.for "cY", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "cY" model.circle1.cy CY
          , label [HAtt.for "rad", HAtt.style "padding" "10px"] [Html.text "Radius:"]
          , viewInput "number" "" "rad" model.circle1.radius Radius
          , label [HAtt.for "ccol", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "ccol" model.circle1.ccolor CColor
          , button [onClick RandomCX, HAtt.style "margin-left" "10px"][Html.text "X"]
          , button [onClick RandomCY, HAtt.style "margin-left" "10px"][Html.text "Y"]
          , button [onClick RandomR, HAtt.style "margin-left" "10px"][Html.text "R"]
          , br [] []
          , label [HAtt.for "cX2", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "cX2" model.circle2.cx CX2
          , label [HAtt.for "cY2", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "cY2" model.circle2.cy CY2
          , label [HAtt.for "rad2", HAtt.style "padding" "10px"] [Html.text "Radius:"]
          , viewInput "number" "" "rad2" model.circle2.radius Radius2
          , label [HAtt.for "ccol2", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "ccol2" model.circle2.ccolor CColor2
          , br [] []
          , label [HAtt.for "cX3", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "" "cX3" model.cx3 CX3
          , label [HAtt.for "cY3", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "" "cY3" model.cy3 CY3
          , label [HAtt.for "rad3", HAtt.style "padding" "10px"] [Html.text "Radius:"]
          , viewInput "number" "" "rad3" model.radius3 Radius3
          , label [HAtt.for "ccol3", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "ccol3" model.ccolor3 CColor3
        ]
        , div [HAtt.style "padding-bottom" "25px"] 
        [   h4 [HAtt.style "padding-left" "10px"] [Html.text "Triangle:"]
          , label [HAtt.for "p1x", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 1" "p1x" model.p1x P1X
          , label [HAtt.for "p1y", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 1" "p1y" model.p1y P1Y
          , label [HAtt.for "p2x", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 2" "p2x" model.p2x P2X
          , label [HAtt.for "p2y", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 2" "p2y" model.p2y P2Y
          , label [HAtt.for "p3x", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 3" "p3x" model.p3x P3X
          , label [HAtt.for "p3y", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 3" "p3y" model.p3y P3Y
          , label [HAtt.for "tcol", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "tcol" model.tcolor TColor
          , br [] []
          , label [HAtt.for "p1x2", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 1" "p1x2" model.p1x2 P1X2
          , label [HAtt.for "p1y2", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 1" "p1y2" model.p1y2 P1Y2
          , label [HAtt.for "p2x2", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 2" "p2x2" model.p2x2 P2X2
          , label [HAtt.for "p2y2", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 2" "p2y2" model.p2y2 P2Y2
          , label [HAtt.for "p3x2", HAtt.style "padding" "10px"] [Html.text "X:"]
          , viewInput "number" "Point 3" "p3x2" model.p3x2 P3X2
          , label [HAtt.for "p3y2", HAtt.style "padding" "10px"] [Html.text "Y:"]
          , viewInput "number" "Point 3" "p3y2" model.p3y2 P3Y2
          , label [HAtt.for "tcol2", HAtt.style "padding" "10px"] [Html.text "Color:"]
          , viewInput "text" "" "tcol2" model.tcolor2 TColor2
        ]
        , div [HAtt.style "background-color" "black", HAtt.style "width" "100%", HAtt.style "height" "10px"] []
        , viewShapes model
        , div [HAtt.style "background-color" "black", HAtt.style "width" "100%", HAtt.style "height" "10px"] []
        , viewAreas model
        , div [HAtt.style "background-color" "black", HAtt.style "width" "100%", HAtt.style "height" "10px"] []      
      ]


-- Function that creates an html input element. 
-- Modeled after the one in the Elm form example: https://elm-lang.org/examples/forms
viewInput : String -> String -> String -> String -> (String -> msg) -> Html msg
viewInput t p i v toMsg =
  input [ HAtt.type_ t, placeholder p, HAtt.id i, value v, onInput toMsg] []


-- Function that displays the shapes.
viewShapes : Model -> Html Msg
viewShapes model =
    div [HAtt.style "padding-top" "30px", HAtt.style "padding-bottom" "30px"]
    [ svg
      [ Att.width "1100", Att.height "700", Att.viewBox "0 0 1100 700", HAtt.style "padding" "10px"]
      [ rect [Att.x "0", Att.y "0", Att.width "1100", Att.height "700", Att.fill "white", Att.stroke "black", Att.strokeWidth "5"] []
      , rect [ Att.x model.positionX, Att.y model.positionY, Att.width model.width, Att.height model.height, Att.fill model.color] [] 
      , circle [ Att.cx model.circle1.cx, Att.cy model.circle1.cy, Att.r model.circle1.radius, Att.fill model.circle1.ccolor] []
      , polygon [Att.points (concat[model.p1x, ",", model.p1y, " ", model.p2x, ",", model.p2y, " ", model.p3x, ",", model.p3y]), Att.fill model.tcolor] []
      , rect [ Att.x model.positionX2, Att.y model.positionY2, Att.width model.width2, Att.height model.height2, Att.fill model.color2] []
      , circle [ Att.cx model.circle2.cx, Att.cy model.circle2.cy, Att.r model.circle2.radius, Att.fill model.circle2.ccolor] [] 
      , polygon [Att.points (concat[model.p1x2, ",", model.p1y2, " ", model.p2x2, ",", model.p2y2, " ", model.p3x2, ",", model.p3y2]), Att.fill model.tcolor2] []
      , rect [ Att.x model.positionX3, Att.y model.positionY3, Att.width model.width3, Att.height model.height3, Att.fill model.color3] []
      , rect [ Att.x model.positionX4, Att.y model.positionY4, Att.width model.width4, Att.height model.height4, Att.fill model.color4] []
      , circle [ Att.cx model.cx3, Att.cy model.cy3, Att.r model.radius3, Att.fill model.ccolor3] [] 
      ]
    ]


-- Function that displays the shape's area values.
viewAreas : Model -> Html Msg
viewAreas model =
  div [HAtt.style "padding-left" "900px"]
    [ h3 [] [Html.text "Area in Pixels"]
    , h4 [] [Html.text "Rectangles:"]
    , ul [] [ li [] [Html.text (String.fromInt(rectangleArea (Maybe.withDefault 0 (String.toInt(model.width))) (Maybe.withDefault 0 (String.toInt(model.height)))))]
            , li [] [Html.text (String.fromInt(rectangleArea (Maybe.withDefault 0 (String.toInt(model.width2))) (Maybe.withDefault 0 (String.toInt(model.height2)))))]
            , li [] [Html.text (String.fromInt(rectangleArea (Maybe.withDefault 0 (String.toInt(model.width3))) (Maybe.withDefault 0 (String.toInt(model.height3)))))]
            , li [] [Html.text (String.fromInt(rectangleArea (Maybe.withDefault 0 (String.toInt(model.width4))) (Maybe.withDefault 0 (String.toInt(model.height4)))))]
            ]
    , h4 [] [Html.text "Circles:"]
    , ul [] [ li [] [Html.text (String.fromInt(round (circleArea (Maybe.withDefault 0 (String.toFloat(model.circle1.radius))))))]
            , li [] [Html.text (String.fromInt(round (circleArea (Maybe.withDefault 0 (String.toFloat(model.circle2.radius))))))]
            , li [] [Html.text (String.fromInt(round (circleArea (Maybe.withDefault 0 (String.toFloat(model.radius3))))))]
            ]
    , h4 [] [Html.text "Triangles:"]
    , ul [] [ li [] [Html.text (String.fromFloat(triangleArea (Maybe.withDefault 0 (String.toFloat(model.p1x))) (Maybe.withDefault 0 (String.toFloat(model.p1y))) (Maybe.withDefault 0 (String.toFloat(model.p2x))) (Maybe.withDefault 0 (String.toFloat(model.p2y))) (Maybe.withDefault 0 (String.toFloat(model.p3x))) (Maybe.withDefault 0 (String.toFloat(model.p3y))) ))]    
            , li [] [Html.text (String.fromFloat(triangleArea (Maybe.withDefault 0 (String.toFloat(model.p1x2))) (Maybe.withDefault 0 (String.toFloat(model.p1y2))) (Maybe.withDefault 0 (String.toFloat(model.p2x2))) (Maybe.withDefault 0 (String.toFloat(model.p2y2))) (Maybe.withDefault 0 (String.toFloat(model.p3x2))) (Maybe.withDefault 0 (String.toFloat(model.p3y2))) ))]    
            ]
    ]



-- Area Calculation Functions

rectangleArea : Int -> Int -> Int
rectangleArea x y = x * y  

circleArea : Float -> Float
circleArea r = pi * (r ^ 2)

triangleArea : Float -> Float -> Float -> Float -> Float -> Float -> Float
triangleArea x1 x2 y1 y2 z1 z2 = abs (((x1 * (y2 - z2)) + (y1 * (z2 - x2)) + (z1 * (x2 - y2))) / 2)




{-
  Project Notes:

  Things explored in this project:
      - Building dynamic forms and buttons in Elm.
      - Using Elm's Svg package to generate shapes.
      - Using Elm's Random package to generate random numbers.
      - Using a few of Elm's basic Math functions including pi and abs
      - Building functions in Elm. 
      - Using Elm's Html package to build a webpage.

  Things to do and explore in the future:
      - I feel like a lot of my code is repetative, and I would like to 
        find a few ways to refactor my code so that it's less so.
          - At one point I was trying to move my shapes out into their own modules, 
            but I couldn't get that to work with my limited Elm knowledge.
            Something to possibly revisit once I understand Elm better.
          - Continue to refactor the code through the use of a shape type alias?
          - Create additional view functions like the viewInput function for the 
            other html elements in use (buttons and labels).
          - Create a view function for each shape type on the form.
      - I did look into implementing Drag and Drop functionality on my shapes, and I
        did find a good example of how this would work: https://benthepoet.github.io/elm-svg-drag-and-drop/
        but I haven't had a chance to explore it further.
          - At a glance, it seems like it might be easier to test this out in a seperate project
            and slowly build it from there, instead of trying to refactor my current project.
            At least, at this stage of my learning, that is how I would tackle it.  Once I
            get a hang of Svg.Events, applying it to this project might not be as daunting.
      - As suggesting in my project proposal comments, I did consider ways to store an image that a user 
        may have built.  From my limited understanding of Elm it seems like the best way to do this
        would be through the use of the Json.Decode and Json.Encode packages.  If we saved the form values into a 
        Json object we should be able to store it in a document for later use.  Json.Decode and Json.Encode
        are Elm packages that should help us achive this.
        Another solution would be to store it in the url, and Elm also has a URL package to help 
        handle this.  
-}
