import Test.QuickCheck

numbersSample :: IO ()
numbersSample =
    let genNumbers = sequence [choose (1, 10), return 20, return 30] :: Gen [Int]
    in sample genNumbers

notZeroSample :: IO ()
notZeroSample =
    let genNotZero = oneof [choose (-10, -1), choose (1, 10)] :: Gen Int
    in sample genNotZero

vowelSample :: IO ()
vowelSample =
    let genVowel = oneof [
            return 'a',
            return 'e',
            return 'i',
            return 'o',
            return 'u',
            return 'y'] :: Gen Char
    in sample genVowel

main :: IO ()
main = do
    numbersSample
    notZeroSample
    vowelSample
