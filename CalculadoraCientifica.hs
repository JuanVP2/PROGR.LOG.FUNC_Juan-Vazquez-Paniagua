import Prelude hiding (sin, cos, tan, exp, log)
import qualified Prelude as P

sin :: Float -> Float
sin = P.sin

cos :: Float -> Float
cos = P.cos

tan :: Float -> Float
tan = P.tan

exp :: Float -> Float
exp = P.exp

log :: Float -> Float
log = P.log

applyFunction :: (Float -> Float) -> Int -> [(Int, Float)]
applyFunction f n = [(i, f (fromIntegral i)) | i <- [1..n]]

calculator :: IO ()
calculator = do
    putStrLn "Introduce la función a aplicar (sin, cos, tan, exp, log): "
    f <- getLine
    putStrLn "Introduce un entero positivo: "
    n <- readLn :: IO Int
    let result = applyFunction (case f of
                                    "sin" -> sin
                                    "cos" -> cos
                                    "tan" -> tan
                                    "exp" -> exp
                                    "log" -> log
                                    _     -> error "Función no reconocida") n
    mapM_ (\(i, j) -> putStrLn $ show i ++ "\t" ++ show j) result

main :: IO ()
main = calculator