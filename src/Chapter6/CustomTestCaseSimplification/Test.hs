import Test.QuickCheck

data Expression
    = Const Int
    | Add Expression Expression
    | Mul Expression Expression
    deriving Eq

instance Show Expression where
    show (Const n) = show n
    show (Add e1 e2) = "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
    show (Mul e1 e2) = "(" ++ show e1 ++ " * " ++ show e2 ++ ")"

eval :: Expression -> Int
eval (Const n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2

rewrite :: Expression -> Expression
rewrite e = case e of
    (Add e1 e2) | e1 == e2 -> Mul (Const 2) e1
    (Mul (Const 0) _) -> Const 0
    (Add (Const 1) e2) -> e2
    -- (Add (Const 0) e2) -> e2
    _ -> e

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

propRewrite :: Property
propRewrite = forAll genExpr $ \expr ->
    eval (rewrite expr) == eval expr

main :: IO ()
main = quickCheckWith (stdArgs { maxSuccess = 10000 }) propRewrite
