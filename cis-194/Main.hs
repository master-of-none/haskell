module Main where

import CreditCard

main :: IO ()
main = do
    let testResultDigits = toDigitsTest
    putStrLn $ "Test Result is: " ++ show testResultDigits
    let testResultDigitsRev = toDigitsRevTest
    putStrLn $ "Test Result is: " ++ show testResultDigitsRev