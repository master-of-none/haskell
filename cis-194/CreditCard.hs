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

doubleEveryOtherTest :: Bool
doubleEveryOtherTest =
    and
        [ [1] == doubleEveryOther [1]
        , [6, 4] == doubleEveryOther [3, 4]
        , [1, 4, 3] == doubleEveryOther [1, 2, 3]
        , [16, 7, 12, 5] == doubleEveryOther [8, 7, 6, 5]
        ]

-- Exercise 3 --
sumDigits :: [Integer] -> Integer
sumDigits = sum . concatMap toDigits

sumDigitsTest :: Bool
sumDigitsTest = 
    and 
    [
        1 == sumDigits [1],
        10 == sumDigits [6, 4],
        6 == sumDigits [1, 2, 3],
        22 == sumDigits [16, 7, 12, 5]
    ]