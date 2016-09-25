module Foldable where

import Data.Foldable
{-
 - Consider the following algrebraic datatype Tree3 a of ternary trees with 
 - labels at the leaves and its canonical fold operation
 -
 - data Tree3 a = Node (Tree3 a) (Tree3 a) (Tree3 a) | Leaf a
 - 
 - Instantiate the type class Foldable for Tree3 such that foldr computes the 
 - fold over the inorder traversal of the tree.
 -
 - inorder t = treeFold (\x l r -> l ++ [x] ++ r) [] t
 -}

data Tree3 a = Node (Tree3 a) (Tree3 a) (Tree3 a) | Leaf a

instance Foldable Tree3 where
  foldr f z (Leaf x) = f x z
  foldr f z (Node l m r) = foldr f (foldr f (foldr f z r) m) l
