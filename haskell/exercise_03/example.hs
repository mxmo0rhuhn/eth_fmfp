{-
 - pascals's triangle
 -}

pascalRow :: Int -> [Int]
pascalRow 0 = [1]
pascalRow n = aux (pascalRow (n-1))
  where
    aux xs = 1 : (add (init xs) (tail xs)++ [1])
    add [] _          = []
    add (x:xs) (y:ys) =  x+y : add xs ys

{-
 - Sum of the nth row of the Pascals's triangle
 -}
pascalSum :: Int -> Int
pascalSum n = foldr (+) 0 ( pascalRow n )


{-
 - foldr stufff
 -}

-- listMax[2,0,5] = 5
listMax :: [Int] -> Int
listMax xs = foldr max (head xs) xs

factorial :: Int -> Int
factorial n = foldr (*) 1 [1..n]

{- 
 - list comprehensions
 -}


--functionPairs [1,2,3][1..9] (\x -> x * x)
--[(1,1),(2,4),(3,9)]
functionPairs :: Eq b => [a] -> [b] -> (a -> b) -> [(a,b)]
functionPairs as bs f = [ (a,b)  | a <- as, b <-bs, b == f a ]
