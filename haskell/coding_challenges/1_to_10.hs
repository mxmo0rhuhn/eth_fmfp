-- 1
-- (*) Find the last element of a list. 

myLast :: [a] -> a 
myLast [] = error "no goood - don't do that"
myLast (x:xs) = aux x xs
  where 
    aux x [] = x
    aux _ (x:xs) = aux x xs

-- 2
-- (*) Find the last but one element of a list. 

myButLast :: [a] -> a 
myButLast [] = error "no goood - don't do that"
myButLast [x] = error "no goood - don't do that"
myButLast (x:y:[]) = x
myButLast (x:xs) = myButLast (xs)

-- 3
-- (*) Find the K'th element of a list. The first element in the list is number 1. 

elementAt :: [a] -> Int -> a
elementAt x num
  | num < 1 = error "no goood - don't do that"
elementAt [] _ = error "no goood - don't do that"
elementAt (x:xs) 1 = x 
elementAt (x:xs) i = elementAt xs (i-1)

-- 4
-- (*) Find the number of elements of a list. 

myLength :: [a] -> Int
myLength xs = foldr (+) 0 ( map ( \x -> 1 ) xs )
-- aka myLength xs = sum ( map ( \x -> 1 ) xs )
myLength2 :: [a] -> Int
myLength2 xs = foldr ( \x -> (+) 1 ) 0 xs  

-- 5
-- (*) Reverse a list. 

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = ( myReverse xs ) ++ [x]

-- 6
-- (*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x). 

isPalindrome :: Ord a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome  xs
  | head xs == last xs = isPalindrome ( tail ( init xs )) 
  | otherwise = False

isPalindrome2 :: Ord a => [a] -> Bool
isPalindrome2 xs = xs == reverse xs 

-- 7
-- (**) Flatten a nested list structure. 
--
-- Transform a list, possibly holding lists as elements into a `flat' 
-- list by replacing each list with its elements (recursively). 

data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem a) = [a]
flatten (List x) = concatMap flatten x

-- 8
--(**) Eliminate consecutive duplicates of list elements.
--
-- If a list contains repeated elements they should be replaced with a 
-- single copy of the element. The order of the elements should not be changed. 
-- 
-- > compress "aaaabccaadeeee"
-- "abcade"
compress :: String -> String
compress [] = []
compress (x:xs) = aux x xs
  where 
    aux x []       = [x]
    aux cur (x:xs) 
      | cur == x   = aux x xs
      | otherwise  = cur : (aux x xs)

-- 9 
-- (**) Pack consecutive duplicates of list elements into sublists. If a list 
-- contains repeated elements they should be placed in separate sublists. 
--
-- > pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-- ["aaaa","b","cc","aa","d","eeee"]

pack :: String -> [String]
pack []     = []
pack (x:xs) = aux [x] xs
  where 
    aux :: String -> String -> [String]
    aux packed [] = [packed]
    aux packed (x:xs)
      | (head packed) == x = ( aux (packed ++ [x]) xs )
      | otherwise          = [packed] ++ ( aux [x] xs )

-- 10
--(*) Run-length encoding of a list. Use the result of problem P09 to implement the 
-- so-called run-length encoding data compression method. Consecutive duplicates of 
-- elements are encoded as lists (N E) where N is the number of duplicates of the 
-- element E. 
-- 
-- > encode "aaaabccaadeeee"
-- [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]

encode :: String -> [(Int, Char)]
encode [] = []
encode xs = map ( \x -> ( length x , head x ) ) (pack xs)
