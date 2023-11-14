module Main where

import LogAnalysis

main :: IO()
main = do 
    let testResult1 = parseMessageTest
    putStrLn $ "The test result 1 is: " ++ show testResult1
    let testResult2 = insertTest
    putStrLn $ "The test result 2 is: " ++ show testResult2