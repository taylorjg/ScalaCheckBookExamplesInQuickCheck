import Test.QuickCheck

data Tree a
    = Leaf a
    | Node [Tree a]
    deriving Show

-- treeSize :: Tree a -> Int
-- treeSize (Leaf _) = 1
-- treeSize (Node children) = sum $ map treeSize children

genTree :: Gen a -> Gen (Tree a)
genTree genT = oneof [genLeaf genT, genNode genT]

genLeaf :: Gen a -> Gen (Tree a)
genLeaf genT = Leaf `fmap` genT

genNode :: Gen a -> Gen (Tree a)
genNode genT =
    sized $ \size ->
        do
            s <- choose (0, size)
            let g = resize (size `div` (s + 1)) (genTree genT)
            children <- vectorOf s g
            return $ Node children

genIntTree :: Gen (Tree Int)
genIntTree = genTree (arbitrary :: Gen Int)

intTreeSample :: IO ()
intTreeSample = sample genIntTree

main :: IO ()
main = intTreeSample
