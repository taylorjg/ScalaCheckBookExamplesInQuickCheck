import Test.QuickCheck

data Expression
    = Const Int
    | Add Expression Expression
    | Mul Expression Expression

instance Show Expression where
    show (Const n) = show n
    show (Add e1 e2) = "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
    show (Mul e1 e2) = "(" ++ show e1 ++ " * " ++ show e2 ++ ")"

-- eval :: Expression -> Int
-- eval (Const n) = n
-- eval (Add e1 e2) = eval e1 + eval e2
-- eval (Mul e1 e2) = eval e1 * eval e2

genExpr :: Gen Expression
genExpr =
    sized $ \sz ->
        let k = sz - (round (sqrt (realToFrac sz :: Double)))
        in frequency [
            (1, genConst),
            (k, resize (sz `div` 2) genAdd),
            (k, resize (sz `div` 2) genMul)]

genConst :: Gen Expression
genConst = Const `fmap` choose (0, 10)

genAdd :: Gen Expression
genAdd = do
    e1 <- genExpr
    e2 <- genExpr
    return $ Add e1 e2

genMul :: Gen Expression
genMul = do
    e1 <- genExpr
    e2 <- genExpr
    return $ Mul e1 e2

-- propRewrite :: Property
-- propRewrite = undefined

main :: IO ()
-- main = return ()
main = sample genExpr
