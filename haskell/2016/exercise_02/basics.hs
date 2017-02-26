-- Only positive numbers
-- Sort out base cases first and then go into recursion
mult :: Int -> Int -> Int
mult 0 b = 0
mult n b = b + mult (n - 1) b

-- Only positive numbers
-- Sort out base cases first and then go into recursion
-- log2 256
log2 :: Int -> Int
log2 1 = 0
log2 n = 1 + log2 ( div n 2 )

-- Ugly - just to learn recusion
-- isPrime 17 => True
-- isPrime 15 => False
isPrime :: Int -> Bool
isPrime 1 = False
isPrime n = aux n 2
  -- i: test al numbers from n if they divide n
  where 
    aux n i 
      | i == n = True
      | (mod n i) == 0 = False
      | otherwise = aux n (i +1)

-- subsetSum [1,(-2),5, (-7)] 3 => True
-- subset sum Problem
subsetSum :: [Int] -> Int -> Bool
subsetSum [] n = (n == 0)
subsetSum (x:xs) n = subsetSum xs n || subsetSum xs (x - n)
