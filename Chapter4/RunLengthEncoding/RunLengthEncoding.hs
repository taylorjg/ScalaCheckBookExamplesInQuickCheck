module RunLengthEncoding (runLengthEnc, runLengthDec) where

runLengthEnc :: Eq a => [a] -> [(Int, a)]
runLengthEnc xs =
	loop xs Nothing
	where
		loop :: Eq a => [a] -> Maybe (Int, a) -> [(Int, a)]
		loop xs currTuple =
			case (xs, currTuple) of
				([], Nothing) -> []
				([], Just(t)) -> [t]
				(x:rest, Nothing) -> loop rest (Just (1, x))
				(x1:rest, Just((n, x2))) | x1 == x2 -> loop rest (Just (n + 1, x2))
				(x:rest, Just(t)) -> t:loop rest (Just (1, x))

runLengthDec :: [(Int, a)] -> [a]
runLengthDec = (>>= uncurry replicate)
