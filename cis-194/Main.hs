module Main where

import CreditCard

main :: IO ()
main = do
    let testResult = toDigitsTest
    putStrLn $ "Test Result is: " ++ show testResult
