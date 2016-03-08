{- 
 - some list learing
 -}
import Prelude hiding (last,init, (!!))

-- return the last element of the list
last :: [a] -> a
last [] = error "Empty list doesn't have a last element"
last [a] = a
last [x:xs] = last xs

-- return all elements ot the list except the last one
init :: [a] -> [a]
init [] = []
init [a] = []
init (x:xs) = x : init xs

-- return the nth element 
(!!) :: Int -> [a] -> a -- zero-based
(!!) _ []     = error "" -- will also catch negative indices
(!!) 0 (x:xs) = x
(!!) n (x:xs) = (n - 1) !! xs
