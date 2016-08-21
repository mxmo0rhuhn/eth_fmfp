data Interval a = V a a 

make :: Ord  a => a -> a -> Interval a
make x y 
  | x < y     = (V x y)
  | otherwise = (V y x)

instance  (Show a) => Show (Interval a) where
  show (V a b) = "[" ++ show a ++ "," ++ show b ++ "]"

intersect :: Ord a => [Interval a] -> Maybe (Interval a)
intersect [] = Nothing
intersect [x] = Just x 
intersect ((V l1 u1):(V l2 u2):rest)
 | l1 >= l2 && u1 <= u2 && u1 >= l1 = intersect ((V l1 u1):rest)
 | l1 >= l2 && u2 <= u1 && u2 >= l1 = intersect ((V l1 u2):rest)
 | l2 >= l1 && u1 <= u2 && u1 >= l2 = intersect ((V l2 u1):rest)
 | l2 >= l1 && u2 <= u1 && u2 >= l2 = intersect ((V l2 u2):rest)
 | otherwise = Nothing
