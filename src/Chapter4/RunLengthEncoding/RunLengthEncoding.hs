module Chapter4.RunLengthEncoding.RunLengthEncoding (runLengthEnc, runLengthDec) where

runLengthEnc :: Eq a => [a] -> [(Int, a)]
runLengthEnc [] = []
runLengthEnc xs@(hd:_) =
    (length matching, hd):runLengthEnc nonMatching
    where
        (matching, nonMatching) = break (/=hd) xs

runLengthDec :: [(Int, a)] -> [a]
runLengthDec = (>>= uncurry replicate)
