-- Definimos la función grade
grade :: Float -> String
grade score
    | score < 50   = "Desempeño insuficiente"
    | score < 70   = "Suficiente"
    | score < 90   = "Bueno"
    | score < 100  = "Notable"
    | otherwise   = "excelente"

-- Definimos la función applyGrade
applyGrade :: [Float] -> [String]
applyGrade scores = map grade scores

-- Ejemplo de uso
main :: IO ()
main = print $ applyGrade [100, 60, 70, 80, 30, 90, 100]
