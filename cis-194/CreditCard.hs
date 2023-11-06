{-# OPTIONS_GHC -Wall #-}

module CreditCard where

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
