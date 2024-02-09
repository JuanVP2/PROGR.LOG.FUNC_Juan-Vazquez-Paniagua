-- Definimos la función filtraLista
filtraLista :: (a -> Bool) -> [a] -> [a]
filtraLista funcion lista = [x | x <- lista, funcion x]

-- Definimos la función par
par :: Integral a => a -> Bool
par n = n `mod` 2 == 0

-- Ejemplo de uso
main :: IO ()
main = print $ filtraLista par [1, 2, 3, 4, 5, 6, 7,8]
