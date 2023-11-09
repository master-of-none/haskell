module Main where

import CreditCard

main :: IO ()
main = do
    let testResultDigits = toDigitsTest
    putStrLn $ "Test Result 1 is: " ++ show testResultDigits
    let testResultDigitsRev = toDigitsRevTest
    putStrLn $ "Test Result 2 is: " ++ show testResultDigitsRev
    let testDoubleEveryDigit = doubleEveryOtherTest
    putStrLn $ "Test Result 3 is: " ++ show testDoubleEveryDigit
    let testSumDigits = sumDigitsTest
    putStrLn $ "Test Result 4 is: " ++ show testSumDigits