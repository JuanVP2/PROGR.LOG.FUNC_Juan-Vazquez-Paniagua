-- Funcion para la media de una lista de numeros
media :: (Fractional a) => [a] -> a
media xs = sum xs / fromIntegral (length xs)

-- Funcion para la desviacion estándar de una lista de numeros
desviacionEstandar :: (Floating a) => [a] -> a
desviacionEstandar xs =
  let m = media xs
      n = fromIntegral $ length xs
      squaredDiffs = map (\x -> (x - m) ^ 2) xs
  in sqrt (sum squaredDiffs / n)

-- Funcion para determinar si un valor es atipico en funcion de la media y la desviacion estandar
atipico :: (Floating a, Ord a) => [a] -> a -> Bool
atipico muestra n =
  let mediaMuestra = media muestra
      desviacion = desviacionEstandar muestra
      puntuacion = (n - mediaMuestra) / desviacion
  in puntuacion < -3 || puntuacion > 3

-- Funcion para filtrar los datos atipicos de una muestra
datosAtipicos :: (Floating a, Ord a) => [a] -> [a]
datosAtipicos muestra = filter (atipico muestra) muestra

main :: IO ()
main = print $ datosAtipicos [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,11,2,100]