-- Declaratios and Variables --
{-
  To load the haskell file
  1) go to ghci
  2) write command :load <filename> - without extension
-}
x :: Int
x = 3

-- The below Code yields infinite loop
{-
y :: Int
y = y + 1
-}

-- Functions
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

-- Can also write the above function as below
sums :: Integer -> Integer
sums n
  | n == 0 = 0
  | otherwise = n + sums (n - 1)
