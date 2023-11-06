sumValue :: [Int] -> Int
sumValue [] = 0
sumValue (n : ns) = n + sumValue ns

main :: IO ()
main = do
  let numbers = [1, 2, 3, 4, 5]
  putStrLn $ "Sum of numbers is " ++ show (sumValue numbers)

{--
 - $ is used to avoid paranthesis
 - show is used to convert to string
 - To run this code, main IS necessary and sum function is written seperately
 - The signature is given at first, it means that it takes list of integers and returns integer.
 - --}
