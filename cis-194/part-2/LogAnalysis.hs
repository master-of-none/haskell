{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use &&" #-}

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

-- Exercise 2 --
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert msg Leaf = Node Leaf msg Leaf
insert msg@(LogMessage _ ts1 _) (Node left msg2@(LogMessage _ ts2 _) right)
    | ts1 < ts2 = Node(insert msg left) msg2 right
    | otherwise = Node left msg2 (insert msg right)
insert _(Node _ (Unknown _) _) =
        error "Cannot insert Unknown message to Message Tree"

insertTest :: Bool
insertTest = and
    [
        Node Leaf info Leaf == insert info Leaf,
        Node Leaf info (Node Leaf warning Leaf) == insert warning infoTree,
        Node (Node Leaf info Leaf) warning Leaf == insert info warningTree
    ]
    where 
        info = LogMessage Info 30 "Some info"
        infoTree = Node Leaf info Leaf
        warning = LogMessage Warning 50 "Some warning"
        warningTree = Node Leaf warning Leaf

-- Exercise 3 --
build :: [LogMessage] -> MessageTree
build = foldr insert Leaf

buildTest :: Bool
buildTest = and
    [
        Node Leaf info Leaf == build [info],
        Node (Node Leaf info Leaf) warning Leaf == build [info, warning],
        Node Leaf info (Node Leaf warning Leaf) == build [warning, info, unknown]
    ]
    where 
        info = LogMessage Info 10 "Some information"
        warning = LogMessage Warning 20 "Some warning"
        unknown = Unknown "Some unknown"