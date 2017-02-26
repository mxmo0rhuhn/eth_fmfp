{-
 Give equivalent definitions for the following primitively 
 recursive functions on lists, without using explicit recursion. 
 That is, use map, foldl, foldr, zip, zipWith, filter, curry,
 uncurry, etc. Do define aux explicitly before defining h.

f :: [[a]] -> [a]
f [] = []
f (x:xs) = reverse x ++ f xs

Example: g ([1],[1]) doesn't work in ghci 
(GHCi, version 7.6.3: http://www.haskell.org/ghc/): 
    Couldn't match expected type `[a0]' with actual type `([t0], [t1])'
    In the first argument of `g', namely `([1], [1])'
    In the expression: g ([1], [1])
    In an equation for `it': it = g ([1], [1])

g :: Eq a => [a] -> [a] -> [a]
g [] _ = []
g _ [] = []
g (x:xs) (y:ys)
        | x == y = x : g xs ys
        | otherwise = g xs ys

h :: [Int] -> Int
h = aux 0
   where
      aux z [] = z
      aux z (x:xs)
        | even x = aux (1 + z) xs
        | otherwise = aux z xs
-}

f :: [[a]] -> [a]
f = foldr (\x y -> (reverse x) ++ y) []
-- f = concatMap reverse

g :: Eq a => [a] -> [a] -> [a]
g xs ys = foldr (\z acc -> (fst z) : acc) [] (filter ( \(x,y) -> x == y) (zip xs ys))
-- g xs ys = map fst ( filter (uncurry (==)) (zip xs ys))
-- curryed (==) a -> a -> b
-- uncurryed (==) (a, a) -> b

h :: [Int] -> Int
h xs = foldr (\x acc -> 1 + acc) 0 ( filter even xs)
-- h = length . filter even
