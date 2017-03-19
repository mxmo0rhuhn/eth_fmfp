{-- 
 - A natural number n is called Harshad number, if n is divisible 
 - by the sum of digits in n . Write a function that checks whether 
 - a number is Harshad or not.
 -}

isHarshad :: Int -> Bool
isHarshad 0 = False  -- div / 0 not allowed
isHarshad n = n `mod` (sumd n) == 0
    where
      sumd 0 = 0
      sumd x = (x `mod` 10) + sumd (x `div` 10)
