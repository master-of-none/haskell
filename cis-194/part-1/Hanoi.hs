{-# OPTIONS_GHC -Wall #-}

module Hanoi where

type Peg = String
type Move = (Peg, Peg)

-- Exercise 5 --
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n src dst aux =
    moveFromSrcToAux ++ moveFromSrcToDst ++ moveFromAuxToDst
    where
       moveFromSrcToAux = hanoi (n - 1) src aux dst
       moveFromSrcToDst = [(src, dst)]
       moveFromAuxToDst = hanoi (n - 1) aux dst src

hanoiTest :: Bool
hanoiTest = ([("a","c"), ("a","b"), ("c","b")] == hanoi 2 "a" "b" "c") && (32767 == length (hanoi 15 "a" "b" "c"))