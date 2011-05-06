data Pescado = Vieira | Pulpo | Centollo
data Ciudad = Madrid | Barcelona | Lisboa deriving (Show)

precio :: Pescado -> Ciudad -> Integer
precio pescado ciudad = case pescado of
	Vieira -> case ciudad of
		Madrid -> 500
		Barcelona -> 450
		Lisboa -> 600
	Pulpo -> case ciudad of
		Madrid -> 0
		Barcelona -> 120
		Lisboa -> 100
	Centollo -> case ciudad of
		Madrid -> 450
		Barcelona -> 0
		Lisboa -> 500
	
distancia :: Ciudad -> Integer
distancia ciudad = case ciudad of
	Madrid -> 800
	Barcelona -> 1100
	Lisboa -> 600
	
ingresos :: [(Pescado, Integer)] -> Ciudad -> Float
ingresos [] _ = 0
ingresos ((pescado, kg):xs) ciudad =
	((fromIntegral $ precio pescado ciudad) * (1 - (0.01 * fromIntegral (distancia ciudad `div` 100)))) * fromIntegral kg +
	 ingresos xs ciudad

coste :: Ciudad -> Float
coste ciudad = 5 + 2 * fromIntegral (distancia ciudad)

beneficios :: [(Pescado, Integer)] -> Ciudad -> Float
beneficios carga ciudad = ingresos carga ciudad - coste ciudad

mayorBeneficio :: [(Pescado, Integer)] -> [Ciudad] -> Ciudad
mayorBeneficio carga ciudades =
	foldl (\x y -> if beneficios carga x > beneficios carga y then x else y) (head ciudades) (tail ciudades)
	
main = do
	putStrLn . show $ mayorBeneficio [(Vieira, 50), (Pulpo, 100), (Centollo, 50)] [Madrid, Lisboa, Barcelona]