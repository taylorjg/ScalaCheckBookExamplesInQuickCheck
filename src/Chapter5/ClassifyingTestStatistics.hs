import Test.QuickCheck

p :: Int -> Property
p n =
    classify (even n) "even" $
    classify (odd n) "odd" $
    classify (n < 0) "neg" $
    classify (n >= 0) "pos" $
    classify (abs n > 50) "large" $
    n + n == 2 * n

main :: IO ()
main = quickCheck p
