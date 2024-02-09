-- Funcion que aplica un descuento a una cantidad.
applyDiscount :: Float -> Float -> Float
applyDiscount price discount = price - price * discount / 100

-- Funcion que aplica un IVA a una cantidad.
applyIVA :: Float -> Float -> Float
applyIVA price percentage = price + price * percentage / 100

-- Funcion para el precio de una cesta de la compra una vez aplicada una funcion a los precios iniciales.
priceBasket :: [(Float, Float)] -> (Float -> Float -> Float) -> Float
priceBasket basket function = sum [function price discount | (price, discount) <- basket]

main :: IO ()
main = do
    putStrLn "El precio de la compra tras aplicar los descuentos es: "
    print $ priceBasket [(100, 20), (400, 10), (100, 1)] applyDiscount
    putStrLn "El precio de la compra tras aplicar el IVA es: "
    print $ priceBasket [(100, 20), (400, 10), (100, 1)] applyIVA

