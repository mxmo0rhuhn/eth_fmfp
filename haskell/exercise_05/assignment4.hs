 {-
 - Recall the algebraic data type Tree a from the lecture:
 - data Tree t = Leaf | Node t (Tree t) (Tree t)
 -}
data Tree t = Leaf | Node t (Tree t) (Tree t)

 {-
 - (a) Implement a breadth-first traversal on trees of the data type Tree t. 
 - Your function should traverse a given tree level by level (from left to 
 - right) and return a list with the elements that are stored in the tree.
 -}
bfs :: Tree t -> [t]
bfs x = treeTraverse [x]

treeTraverse :: [Tree a] -> [a]
treeTraverse [] = []
treeTraverse ts = rootlabels ++ treeTraverse (concatMap children ts)
  where
    rootlabels = [ x | Node x _ _ <- ts]
    children Leaf         = [] 
    children (Node _ l r) = [l,r] 

{-
 - (c) Write a predicate sortedTree :: Ord t => Tree t -> Bool that checks 
 - whether a tree is a binary search tree, i.e., for every Node x l r, all 
 - entries in l must be smaller than x, and all entries in r must be larger 
 - than x.
 -}
sortedTree :: Ord t => Tree t -> Bool
sortedTree Leaf = True
sortedTree (Node n l r) = all' (<n) l && all' (>n) r && (sortedTree l) && (sortedTree r)
  where
    all' p Leaf = True 
    all' p (Node x l r) = p x && all' p l && all' p r
