module Chapter5.Interleaving.Interleaving (interleave) where

interleave :: [a] -> [a] -> [a]
interleave [] ys = ys
interleave xs [] = xs
interleave xs ys = head xs : head ys : interleave (tail xs) (tail ys)
