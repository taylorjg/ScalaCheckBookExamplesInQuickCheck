import Test.QuickCheck

evenNumberGen :: Gen Int
evenNumberGen = do
    n <- choose (2, 100000)
    return $ 2 * n

oddNumberGen :: Gen Int
oddNumberGen = do
    n <- choose (0, 100000)
    return $ 2 * n + 1

numberGen :: Gen Int
numberGen = frequency [
    (1, oddNumberGen),
    (2, evenNumberGen),
    (4, return 0)]

propNumberGen :: Property
propNumberGen = forAll numberGen $ \n ->
    let l = if n == 0 then "zero"
            else if n `mod` 2 == 0 then "even"
            else "odd"
    in collect l True

main :: IO ()
main = quickCheck propNumberGen
