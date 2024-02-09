-- Definimos la función module'
module' :: Floating a => [a] -> a
module' v = sqrt $ sum $ map (\x -> x^2) v

-- Ejemplo de uso
main :: IO ()
main = do
    print $ module' [3.0, 4.0]
    print $ module' [1, 2, 3]

