import Test.QuickCheck
import Interleaving (interleave)

interleaveProperty :: [Int] -> [Int] -> Property
interleaveProperty xs ys =
    conjoin [p1, p2, p3]
    where
        res = interleave xs ys
        is = [0 .. min (length xs) (length ys) - 1]
        p1 = label "length" $ length xs + length ys == length res
        p2 = label "zip xs" $ xs == map (\i -> res !! (2*i)) is ++ drop (2*length ys) res
        p3 = label "zip ys" $ ys == map (\i -> res !! (2*i+1)) is ++ drop (2*length xs) res

main :: IO ()
main = do
    quickCheck interleaveProperty
