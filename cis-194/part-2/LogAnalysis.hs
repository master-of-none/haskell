{-# OPTIONS_GHC -Wall #-}

module LogAnalysis where

import Log 

-- Exercise 1 --
createInfoMessage :: [String] -> LogMessage
createInfoMessage (timestamp:content) = 
    LogMessage Info (read timestamp) (unwords content)
createInfoMessage msg = error ("Invalid Info: " ++ unwords msg)

createWarningMessage :: [String] -> LogMessage
createWarningMessage (timestamp:content) = 
    LogMessage Warning (read timestamp) (unwords content)
createWarningMessage msg = error ("Invalid Warning: " ++ unwords msg)

createErrorMessage :: [String] -> LogMessage
createErrorMessage (severity:timestamp:content) =
    LogMessage (Error (read severity)) (read timestamp) (unwords content)
createErrorMessage msg = error("Invalid Error: " ++ unwords msg)

createUnknownMessage :: [String] -> LogMessage
createUnknownMessage msg = Unknown (unwords msg)

parseMessage :: String -> LogMessage
parseMessage ('I':msg) = createInfoMessage $ words msg
parseMessage ('W':msg) = createWarningMessage $ words msg
parseMessage ('E':msg) = createErrorMessage $ words msg
parseMessage msg = createUnknownMessage $ words msg

parseMessageTest :: Bool
parseMessageTest = and
    [
        LogMessage Info 6 "Completed armadillo processing" == parseMessage "I 6 Completed armadillo processing",
        LogMessage Warning 5 "Flange is due for a check-up" == parseMessage "W 5 Flange is due for a check-up",
        LogMessage (Error 65) 8 "Bad pickle-flange interaction detected" == parseMessage "E 65 8 Bad pickle-flange interaction detected",
        Unknown "Not the right format" == parseMessage "Not the right format"
    ]
-- Whole File parsing --
parse :: String -> [LogMessage]
parse file = parseMessage <$> lines file