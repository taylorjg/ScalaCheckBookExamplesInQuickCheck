import Test.QuickCheck

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

containsSlice :: [a] -> [a] -> Bool
-- left as an exercise for another day!
containsSlice _ _ = True

propSlice :: [Int] -> Property
propSlice xs =
    forAll (choose (0, length xs - 1)) $ \n ->
        forAll (choose (n, length xs)) $ \m ->
            let
                slice' = slice n m xs
                label' = case length slice' of
                    0 -> "none"
                    1 -> "one"
                    n' | n' == length xs -> "whole"
                    _ -> "part"
            in
                collect label' $ containsSlice xs slice'

main :: IO ()
main = quickCheck propSlice
