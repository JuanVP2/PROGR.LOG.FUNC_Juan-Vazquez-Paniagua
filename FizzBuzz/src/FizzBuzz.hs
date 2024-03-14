module FizzBuzz where

import Data.List (intercalate)

-- Función para determinar si un número es primo
esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = all (\x -> n `mod` x /= 0) [2..isqrt n]
    where isqrt = floor . sqrt . fromIntegral

-- Lista de palabras para las centenas
centenas :: [String]
centenas = ["", "ciento", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", "ochocientos", "novecientos"]

-- Lista de palabras para las decenas
decenas :: [String]
decenas = ["", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"]

-- Lista de palabras especiales para las unidades menores que 20
especiales :: [String]
especiales = ["diez", "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho", "diecinueve"]

-- Lista de palabras para las unidades
unidades :: [String]
unidades = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve"]

-- Función para convertir un número menor que 20 a su representación en palabras en español
lessThan20 :: Int -> String
lessThan20 n
    | n < 10 = unidades !! n
    | otherwise = especiales !! (n - 10)

-- Función para obtener la representación de un número entre 16 y 29
between16and29 :: Int -> String
between16and29 n
    | n < 16 || n > 29 = error "Número fuera de rango"
    | n == 20 = "veinte"
    | n < 20 = especiales !! (n - 10)
    | n `mod` 10 == 0 = decenas !! (n `div` 10)
    | otherwise = decenas !! (n `div` 10) ++ " y " ++ unidades !! (n `mod` 10)

-- Función principal que convierte un número en palabras
numeroEnPalabras :: Int -> String
numeroEnPalabras n
    | n < 0 = "Menos " ++ numeroEnPalabras (abs n)
    | n < 10 = unidades !! n
    | n < 20 = especiales !! (n - 10)
    | n < 100 = decenas !! (n `div` 10) ++ restante (n `mod` 10)
    | n < 1000 = if n `mod` 100 == 0
                    then centenas !! (n `div` 100)
                    else centenas !! (n `div` 100) ++ " " ++ restante (n `mod` 100)
    | n < 1000000 = let (millares, resto) = n `divMod` 1000
                        in if resto == 0
                            then (numeroEnPalabras millares) ++ " mil"
                            else (numeroEnPalabras millares) ++ " mil " ++ restante resto
    | n < 1000000000 = let (millones, resto) = n `divMod` 1000000
                           in if resto == 0
                               then (numeroEnPalabras millones) ++ " millones"
                               else (numeroEnPalabras millones) ++ " millones " ++ restante resto
    | otherwise = error "Número demasiado grande"
    where restante x = if x == 0 then "" else " " ++ numeroEnPalabras x

-- Función principal que realiza la lógica FizzBuzz
fizzBuzz :: Int -> String
fizzBuzz n
    | esPrimo n = "FizzBuzz!"
    | otherwise = numeroEnPalabras n

-- Función principal de entrada
main :: IO ()
main = do
    putStrLn "Ingrese un número entre 0 y 1000000:"
    input <- getLine
    let numero = read input :: Int
    if numero >= 0 && numero <= 1000000
        then putStrLn $ intercalate " " $ words $ fizzBuzz numero
        else putStrLn "Número fuera de rango."
