import Test.QuickCheck
import RunLengthEncoding (runLengthEnc, runLengthDec)

genOutput :: Gen [(Int, Char)]
genOutput = undefined

runLengthEncodingProperty :: Property
runLengthEncodingProperty =
	forAll genOutput $ \r -> runLengthEnc (runLengthDec r) == r

main :: IO ()
main = do
	quickCheck runLengthEncodingProperty
