{- 
 - Some examples of difference lists
 -}

type Dlist a = [a] -> [a]

dempty :: DList a
dempty = \xs -> xs
-- dempty id would also be possible to

dsingle :: a -> Dlist a 
dsingle x = \xs -> x:xs
-- dsingle x xs = x:xs would also be possible to

infixx 5 `dappend` -- 5 describes the priority of the infix binding

dappend :: Dlist a -> Dlist a -> Dlist a 
dappend xs ys = \zs -> xs ( ys zs )
-- dappend xs ys = xs . ys  would also be possible to

fromList :: [a] > DList a 
fromList xs = \ys -> xs ++ ys

toList :: DList a -> [a]
toList xs = xs []

-- Reverse for normal list
rev :: [a] -> [a]
rev = [] = []
rev = (x:xs) = (rev xs) ++ [x]

drev :: [a] -> [a]
drev [] = dempty
drev (x:xs) = toList ( ( drev xs ) `dappend` ( dsingle x ) ) 
