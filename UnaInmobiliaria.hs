data Piso = Piso { año :: Int
                 , metros :: Int
                 , habitaciones :: Int
                 , garaje :: Bool
                 , zona :: Char
                 , precio :: Float
                 } deriving (Show)

pisos :: [Piso]
pisos = [ Piso { año = 2000, metros = 100, habitaciones = 3, garaje = True, zona = 'A', precio = 0 }
        , Piso { año = 2012, metros = 60, habitaciones = 2, garaje = True, zona = 'B', precio = 0 }
        , Piso { año = 1980, metros = 120, habitaciones = 4, garaje = False, zona = 'A', precio = 0 }
        , Piso { año = 2005, metros = 75, habitaciones = 3, garaje = True, zona = 'B', precio = 0 }
        , Piso { año = 2015, metros = 90, habitaciones = 2, garaje = False, zona = 'A', precio = 0 }
        ]

añadirPrecio :: Piso -> Piso
añadirPrecio piso = piso { precio = (fromIntegral (metros piso) * 1000 + fromIntegral (habitaciones piso) * 5000 + if garaje piso then 15000 else 0) * (1 - fromIntegral (2020 - año piso) / 100) * if zona piso == 'B' then 1.5 else 1 }

buscaPiso :: [Piso] -> Float -> [Piso]
buscaPiso pisos presupuesto = filter (\p -> precio p <= presupuesto) (map añadirPrecio pisos)

main :: IO ()
main = print $ buscaPiso pisos 110000
