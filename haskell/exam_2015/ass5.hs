data Heap = Node Int Heap Heap | Leaf

getMin :: Heap -> Maybe Int
getMin Leaf = Nothing
getMin (Node x l r) = Just x

merge :: Heap -> Heap -> Heap
merge Leaf y = y
merge y Leaf = y
merge (Node x1 l1 r1) (Node x2 l2 r2)
  | x1 < x2   = (Node x2 l2 (merge r2 (Node x1 r1 l1)))
  | otherwise = (Node x1 l1 (merge r1 (Node x2 r2 l2)))

delMin :: Heap -> Heap 
delMin Leaf = Leaf
delMin (Node x l r )  = merge l r
