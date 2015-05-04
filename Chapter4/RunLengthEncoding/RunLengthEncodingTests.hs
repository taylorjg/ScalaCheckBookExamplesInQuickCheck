import Test.QuickCheck
import RunLengthEncoding (runLengthEnc, runLengthDec)

genNumChar :: Gen Char
genNumChar = choose ('0', '9')

genAlphaLowerChar :: Gen Char
genAlphaLowerChar = choose ('a', 'z')

genAlphaUpperChar :: Gen Char
genAlphaUpperChar = choose ('A', 'Z')

genAlphaChar :: Gen Char
genAlphaChar = frequency [(1, genAlphaUpperChar), (9, genAlphaLowerChar)]

genAlphaNumChar :: Gen Char
genAlphaNumChar = frequency [(1, genNumChar), (9, genAlphaChar)]

genOutput :: Gen [(Int, Char)]
genOutput =
    sized rleList
    where
        rleItem :: Gen (Int, Char)
        rleItem = do
            n <- choose (1, 20)
            c <- genAlphaNumChar
            return (n, c)
        rleList :: Int -> Gen [(Int, Char)]
        rleList size =
            if size <= 1 then fmap return rleItem
            else do
                tail@((_, c1):_) <- rleList (size - 1)
                head <- suchThat rleItem $ \(_, c2) -> c1 /= c2
                return (head:tail)

runLengthEncodingProperty :: Property
runLengthEncodingProperty =
    forAll genOutput $ \r -> runLengthEnc (runLengthDec r) == r

main :: IO ()
main = quickCheck runLengthEncodingProperty
