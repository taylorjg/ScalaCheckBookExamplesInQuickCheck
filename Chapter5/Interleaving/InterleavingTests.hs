import Test.QuickCheck
import System.Random
import Interleaving (interleave)

interleaveProperty :: [Int] -> [Int] -> Property
interleaveProperty xs ys =
	p1 .&. p2 .&. p3
	where
		res = interleave xs ys
		is = [0 .. min (length xs) (length ys) - 1]
		p1 = label "length" $ length xs + length ys == length res
		p2 = label "zip xs" $ True
		p3 = label "zip ys" $ True

main :: IO ()
main = do
	quickCheck interleaveProperty
