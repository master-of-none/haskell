productVal :: [Int] -> Int
productVal [] = 1
productVal (n : ns) = n * productVal ns

main :: IO ()
main = do
  let numbers = [1, 2, 3, 4, 5]
  putStrLn $ "The product of the values is:" ++ show (productVal numbers)
