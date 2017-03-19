

{-
   In this exercise you are required to adapt the following function implementations of
   f, g and h such that foldl, foldr, zip, zipWith, filter, curry, uncurry, etc. will
   be used. That means, your task is to modify the lines 10-11, 15-19 and 23-28
-}

f :: [[a]] -> [a]
f = foldr ( \x y ->  reverse x ++ y ) []


g :: Eq a => [a] -> [a] -> [a]
g = ( \x y -> map fst ( filter (uncurry (==)) ( zip x y ) ))


h :: [Int] -> Int
h n =  foldr (+) 0 ( map (\x -> 1 ) (filter even n) )

-- Cooler way:
-- h = length . filter even
