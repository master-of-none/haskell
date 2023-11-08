{-# OPTIONS_GHC -Wall #-}

module CreditCard where

-- Exercise 1 --
toDigits :: Integer -> [Integer]
toDigits n
    | n <= 0 = []
    | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

toDigitsTest :: Bool
toDigitsTest =
    and
        [ [1] == toDigits 1
        , [1, 2, 3, 4] == toDigits 1234
        , null (toDigits 0)
        , null (toDigits (-17))
        ]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = n `mod` 10 : toDigitsRev (n `div` 10)

toDigitsRevTest :: Bool
toDigitsRevTest =
    and
        [ [1] == toDigitsRev 1
        , [4, 3, 2, 1] == toDigitsRev 1234
        , null (toDigitsRev 0)
        , null (toDigitsRev (-17))
        ]

-- Exercise 2 --
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1, 2]) . reverse
