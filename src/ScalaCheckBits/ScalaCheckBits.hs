module ScalaCheckBits.ScalaCheckBits (
    genNumChar,
    genAlphaLowerChar,
    genAlphaUpperChar,
    genAlphaChar,
    genAlphaNumChar
) where

import Test.QuickCheck

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
