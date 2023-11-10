module Main where

import CreditCard
import Hanoi

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
    let testValidate = validateTest
    putStrLn $ "Test Result 5 is: " ++ show testValidate
    let testHanoi = hanoiTest
    putStrLn $ "Test reult 6 is: " ++ show testHanoi