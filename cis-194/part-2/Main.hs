module Main where

import LogAnalysis

main :: IO ()
main = do
    let testResult1 = parseMessageTest
    putStrLn $ "The test result 1 is: " ++ show testResult1
    let testResult2 = insertTest
    putStrLn $ "The test result 2 is: " ++ show testResult2
    let testResult3 = buildTest
    putStrLn $ "The test result 3 is: " ++ show testResult3
    let testResult4 = inOrderTest
    putStrLn $ "The test result 4 is: " ++ show testResult4
    let testResult5 = whatWentWrongTest
    putStrLn $ "The test result 5 is: " ++ show testResult5
