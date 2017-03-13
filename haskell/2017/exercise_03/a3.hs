
-- A natural number n ≥ 2 is prime ifits only divisors are 1 and n . 
-- In other words n is prime if
-- {x | 1≤x≤n and n mod x = 0} = {1,n}


-- (a) Use list comprehension to turn this definition into an executable primality test.
prime :: Int -> Bool
prime x = [1, x] == [ n | n <- [1 .. x] , ((mod x n) == 0) ]

-- (b) Write a function that returns the list of all primes up to a given number m.
primes :: Int -> [Int]
primes nu = [ x | x <- [1 .. nu ] , prime x ]

-- (c) Write a function that returns the list of the first m primes.
firstPrimes :: Int -> [Int]
firstPrimes nu  = take nu [ x | x <- [1 .. ] , prime x]
