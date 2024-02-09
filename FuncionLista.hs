-- Definimos la función aplicaFuncionLista
aplicaFuncionLista :: (a -> b) -> [a] -> [b]
aplicaFuncionLista funcion lista = map funcion lista

-- Definimos la función cuadrado
cuadrado :: Num a => a -> a
cuadrado n = n * n

-- Ejemplo de uso
main :: IO ()
main = print $ aplicaFuncionLista cuadrado [1, 2, 3, 4]
