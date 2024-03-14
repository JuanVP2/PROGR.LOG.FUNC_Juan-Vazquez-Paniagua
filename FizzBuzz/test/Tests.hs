module Main where

import Test.Tasty
import Test.Tasty.HUnit

import FizzBuzz

fizzBuzzSuite :: TestTree
fizzBuzzSuite = testGroup "Pruebas de FizzBuzz"
                [ testGroup "fizzBuzz" $
                    [ testCase "0 es cero" $ fizzBuzz 0 @?= "cero"
                    , testCase "6 es seis" $ fizzBuzz 6 @?= "seis"
                    , testCase "12 es doce" $ fizzBuzz 12 @?= "doce"
                    , testCase "1 es uno" $ fizzBuzz 1 @?= "uno"
                    , testCase "7 es FizzBuzz!" $ fizzBuzz 7 @?= "FizzBuzz!"
                    , testCase "8 es ocho" $ fizzBuzz 8 @?= "ocho"
                    , testCase "14 es catorce" $ fizzBuzz 14 @?= "catorce"
                    , testCase "13 es FizzBuzz!" $ fizzBuzz 3 @?= "FizzBuzz!"
                    , testCase "9 es nueve" $ fizzBuzz 9 @?= "nueve"
                    , testCase "15 es quince" $ fizzBuzz 15 @?= "quince"
                    , testCase "4 es cuatro" $ fizzBuzz 4 @?= "cuatro"
                    , testCase "10 es diez" $ fizzBuzz 10 @?= "diez"
                    , testCase "20 es veinte" $ fizzBuzz 20 @?= "veinte"
                    , testCase "5 es FizzBuzz!" $ fizzBuzz 5 @?= "FizzBuzz!"
                    , testCase "11 es FizzBuzz!" $ fizzBuzz 11 @?= "FizzBuzz!"
                    , testCase "30 es treinta" $ fizzBuzz 30 @?= "treinta"
                    ]
                , testGroup "entre16y29" $
                    [
                      testCase "20 es veinte" $ between16and29 20 @?= "veinte"
                    , testCase "26 es veinte y seis" $ between16and29 26 @?= "veinte y seis"
                    , testCase "17 es diecisiete" $ between16and29 17 @?= "diecisiete"
                    , testCase "21 es veinte y uno" $ between16and29 21 @?= "veinte y uno"
                    , testCase "28 es veinte y ocho" $ between16and29 28 @?= "veinte y ocho"
                    , testCase "18 es dieciocho" $ between16and29 18 @?= "dieciocho"
                    , testCase "24 es veinte y cuatro" $ between16and29 24 @?= "veinte y cuatro"
                    , testCase "29 es veinte y nueve" $ between16and29 29 @?= "veinte y nueve"
                    ]
                , testGroup "grupo3" $
                    [ testCase "30 es treinta" $ fizzBuzz 30 @?= "treinta"
                    , testCase "50 es cincuenta" $ fizzBuzz 50 @?= "cincuenta"
                    , testCase "90 es noventa" $ fizzBuzz 90 @?= "noventa"
                    , testCase "31 es FizzBuzz!" $ fizzBuzz 31 @?= "FizzBuzz!"
                    , testCase "60 es sesenta" $ fizzBuzz 60 @?= "sesenta"
                    , testCase "100 es ciento" $ fizzBuzz 100 @?= "ciento"
                    , testCase "70 es setenta" $ fizzBuzz 70 @?= "setenta"
                    , testCase "40 es cuarenta" $ fizzBuzz 40 @?= "cuarenta"
                    , testCase "80 es ochenta" $ fizzBuzz 80 @?= "ochenta"
                    ]
                ,testGroup "Grupo 4 (101-999)"
                    [ testCase "200 es doscientos" $ fizzBuzz 200 @?= "doscientos"
                    , testCase "500 es quinientos" $ fizzBuzz 500 @?= "quinientos"
                    , testCase "800 es ochocientos" $ fizzBuzz 800 @?= "ochocientos"
                    , testCase "300 es trescientos" $ fizzBuzz 300 @?= "trescientos"
                    , testCase "600 es seiscientos" $ fizzBuzz 600 @?= "seiscientos"
                    , testCase "900 es novecientos" $ fizzBuzz 900 @?= "novecientos"
                    , testCase "400 es cuatrocientos" $ fizzBuzz 400 @?= "cuatrocientos"
                    , testCase "700 es setecientos" $ fizzBuzz 700 @?= "setecientos"
                    ]
                ,testGroup "Grupo 5 (1000-999999)"
                    [ testCase "104729 es FizzBuzz!" $ fizzBuzz 104729 @?= "FizzBuzz!"
                    , testCase "10870 diez mil  ochocientos  setenta" $ fizzBuzz 10870 @?= "diez mil  ochocientos  setenta"
                    , testCase "503621 es FizzBuzz!" $ fizzBuzz 503621 @?= "FizzBuzz!"
                    , testCase "709289 setecientos  nueve mil  doscientos  ochenta nueve" $ fizzBuzz 709289 @?= "setecientos  nueve mil  doscientos  ochenta nueve"
                    , testCase "912839 FizzBuzz!" $ fizzBuzz 912839 @?="FizzBuzz!"
                    , testCase "999999 novecientos  noventa nueve mil  novecientos  noventa nueve" $ fizzBuzz 999999 @?= "novecientos  noventa nueve mil  novecientos  noventa nueve"
                    ]
                ]

main :: IO ()
main = defaultMain fizzBuzzSuite