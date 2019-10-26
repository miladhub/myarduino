module Main where

import Arduino.Uno

main = compileProgram $ do

    digitalOutput pin13 =: clock ~> toggle
