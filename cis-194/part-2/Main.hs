module Main where

import LogAnalysis

main :: IO()
main = do 
    let testResult = parseMessageTest
    putStrLn $ "The test result 1 is: " ++ show testResult