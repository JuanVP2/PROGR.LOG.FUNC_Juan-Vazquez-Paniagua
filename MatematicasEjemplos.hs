import Numeric.LinearAlgebra
import Statistics.Sample
import Math.Polynomial
import SymPy
import Math.Functions
import Numeric.GSL.ODE
import Data.VectorSpace

-- Crear una matriz
matriz = (3><3) [1,2,3,
                 4,5,6,
                 7,8,9] :: Matrix Double

-- Calcular la inversa de la matriz
inversa = inv matriz
-- Multiplicar la matriz original por su inversa para obtener la identidad
identidad = matriz `multStd` inversa

-- Calcular la media de una lista de números
media = mean [1.0, 2.0, 3.0, 4.0, 5.0]

-- Calcular la desviación estándar de una lista de números
desviacion = stdDev [1.0, 2.0, 3.0, 4.0, 5.0]

-- Crear un polinomio
polinomio = P [1, 0, -3, 2] 

-- Evaluar el polinomio en un valor específico
resultadoPolinomio = eval polinomio 2 -- Evalúa el polinomio en x = 2

-- Resolver una ecuación simbólicamente
resultadoSimPy = solve (x^2 - 4) x

-- Calcular la función seno de un ángulo en radianes
seno = sin 1.0

-- Calcular la exponencial de un número
exponencial = exp 2.0

-- Definir una ecuación diferencial
derivada :: Double -> [Double] -> [Double]
derivada t [x, y] = [y, -x]

-- Resolver la ecuación diferencial
solucionODE = solveV ODE.AdamsBashforth 0.01 1E-6 1000 derivada [0, 1]

-- Definir vectores en 2D
vector1 = (3, 4)
vector2 = (1, 2)

-- Sumar vectores
sumaVectores = vector1 ^+^ vector2

-- Calcular el producto escalar
productoEscalar = vector1 `dot` vector2