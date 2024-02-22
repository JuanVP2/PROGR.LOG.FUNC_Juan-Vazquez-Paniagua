import Data.Char (toUpper, toLower)
import Distribution.Compat.CharParsing (upper, lower)
--ejercicio 1 **Suma de elementos en una lista:**
sumarLista :: [Int] -> Int
sumarLista [] = 0                   
sumarLista (x:xs) = x + sumarLista xs  

--ejercicio 2 **Factorial:**
factorial :: Int -> Int
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

--ejercicio 3  **Números pares:**
numerosPares :: Int -> [Int]
numerosPares n = [2, 4 .. n]

--ejercicio 4 **Longitud de una cadena:**
longitudCadena :: String -> Int
longitudCadena = length

--ejercicio 5 **Reverso de una lista:**
reversoLista :: [int] -> [int]
reversoLista = reverse

--ejercicio 6 **Duplicar elementos:**
duplicarElementos :: [Int] -> [Int]
duplicarElementos = concatMap (\x -> [x, x])

--ejercicio 7 **Filtrar elementos pares:**
filtrarPares :: [Int] -> [Int]
filtrarPares = filter even

--ejercicio 8 ***Fibonacci:**
fibonacci :: Int -> Int
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

--ejercicio 9 **Divisores de un número:**
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]


--ejercicio 10  **Palíndromo:**
esPalindromo :: String -> Bool
esPalindromo str = str == reverse str
