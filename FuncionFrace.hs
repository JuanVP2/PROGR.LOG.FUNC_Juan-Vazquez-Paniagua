-- Importamos la función `words` para dividir una cadena en palabras
import Data.List (words)

-- Definimos la función lengthWords
lengthWords :: String -> [(String, Int)]
lengthWords sentence = zip (words sentence) (map length (words sentence))

-- Ejemplo de uso
main :: IO ()
main = print $ lengthWords "Hola a Haskell"
