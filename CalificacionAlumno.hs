import qualified Data.Map as Map

-- Definimos un tipo de dato para representar las calificaciones
data Calificacion = Excelente | Notable | Bueno | Suficiente | Insuficiente deriving (Show)

-- Funcion que asigna una calificación a una nota
calificarNota :: Int -> Maybe Calificacion
calificarNota nota
    | nota >= 95 && nota <= 100 = Just Excelente
    | nota >= 85 && nota <= 94 = Just Notable
    | nota >= 75 && nota <= 84 = Just Bueno
    | nota >= 70 && nota <= 74 = Just Suficiente
    | otherwise = Just Insuficiente

-- Funcion que convierte las asignaturas a mayusculas y filtra las calificaciones aprobadas
filtrarCalificacionesAprobadas :: Map.Map String Int -> Map.Map String Calificacion
filtrarCalificacionesAprobadas = Map.mapMaybe calificarNota

-- Funcion principal para probar el código
main :: IO ()
main = do
    let calificacionesAlumno = Map.fromList [("matematicas", 100), ("historia", 84), ("ciencias", 60), ("literatura", 94)]
        calificacionesAprobadas = filtrarCalificacionesAprobadas calificacionesAlumno
    print calificacionesAprobadas
