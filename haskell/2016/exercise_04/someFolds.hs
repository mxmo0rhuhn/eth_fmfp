import Prelude hiding (and, concat, all)

and :: [Bool] -> Bool
and = foldr (&&) True
-- and x = foldr (&&) True x would also be possible

concat :: [ [a] ] -> [a]
concat = foldr (++) []


all :: (a -> Bool) -> [a] -> Bool
all f = foldr aux e
  where
    aux :: a -> Bool -> Bool
    aux a b = f a && b
    -- aux a = (f a &&) would also be possible
    e = True

-- and f = and . map f



-- From exam question
cartesian :: [[a]] -> [[a]]
cartesian = 

-- From exam question
split :: Char -> String -> String
split =
