{-
 - A natural number n >= 2 is prime iff its only divisors are 1 and n. 
 - In other words n is prime iff
 - {x | 1 ≤ x ≤ n and n mod x = 0} = {1, n} .
 -}

{- A)
 - Use list comprehension to turn this definition 
 - into an executable primality test.
 -}
prime :: Int -> Bool
prime x
  | x < 2             = False
  | divisors == [1,x] = True
  | otherwise         = False
    where 
     nrs      = [1 ..  floor ( sqrt ( fromIntegral x )) ] -- sqrt is a performance optimization to pass the big tests - following to the definition you would use just x
     divisors = [y | y <- nrs, mod x  y == 0 ] ++ [x]

{- B)
 - Write a function that returns the list of all 
 - primes up to a given number m.
 -}
primes :: Int -> [Int]
primes m = [ x | x <- [1 .. m], prime x]

{- C)
 - Write a function that returns the list of 
 - the first m primes.
 -}
firstPrimes :: Int -> [Int]
firstPrimes m
  | m < 1     = []
  | otherwise = getPrimes 1 m
    where 
      getPrimes n m 
        | m == 0    = []
        | prime n   = [n] ++ getPrimes (n + 1) (m - 1) 
        | otherwise = getPrimes (n + 1) m 


fancyFirstPrimes :: Int -> [Int]
fancyFirstPrimes m = take m ( filter prime [1..] ) -- works since haskell is lazy and will not create a infinite list
