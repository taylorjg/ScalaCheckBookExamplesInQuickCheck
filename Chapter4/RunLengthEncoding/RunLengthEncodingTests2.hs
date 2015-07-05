module Chapter4.RunLengthEncoding.RunLengthEncodingTests2 (tests) where

-- import Test.QuickCheck
-- import ScalaCheckBits.ScalaCheckBits
-- import Chapter4.RunLengthEncoding.RunLengthEncoding (runLengthEnc, runLengthDec)
import Distribution.TestSuite

-- genOutput :: Gen [(Int, Char)]
-- genOutput =
--     sized rleList
--     where
--         rleItem :: Gen (Int, Char)
--         rleItem = do
--             n <- choose (1, 20)
--             c <- genAlphaNumChar
--             return (n, c)
--         rleList :: Int -> Gen [(Int, Char)]
--         rleList size =
--             if size <= 1 then fmap return rleItem
--             else do
--                 tl@((_, c1):_) <- rleList (size - 1)
--                 hd <- suchThat rleItem $ \(_, c2) -> c1 /= c2
--                 return (hd:tl)
--
-- runLengthEncodingProperty :: Property
-- runLengthEncodingProperty =
--     forAll genOutput $ \r -> runLengthEnc (runLengthDec r) == r

-- main :: IO ()
-- main = quickCheck runLengthEncodingProperty

tests :: IO [Test]
tests = return []
