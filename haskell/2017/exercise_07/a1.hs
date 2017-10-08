data Tree a = Leaf | Node a (Tree a) (Tree a)  deriving (Show, Eq)

labelInOrder :: Tree a -> Tree Int
labelInOrder a = akk a 0 ""
  where 
    akk :: Tree a -> Int -> String -> Int -> String
    akk Leaf t n = n str
    akk (Node a (Leaf) _ ) t n = (n+1) str ++ " " ++ (show n)
    akk (Node a l r) t n = akk l (+1) str ++ " " ++ (show n)

