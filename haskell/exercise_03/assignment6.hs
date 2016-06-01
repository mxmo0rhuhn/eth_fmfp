{-
 -
 - The function filterMap :: (b -> Bool) -> (a -> b) -> [a] -> [b] is defined as
 - follows:
 -   filterMap p f = filter p . map f
 - Note that the ‘.’ above is function composition.
 - Another possible definition is based on foldr :: (a -> b -> b) -> b -> [a] -> b
 -   filterMap’ p f = foldr aux e
 - assuming that aux and e are defined appropriately.
 - Give definitions for aux and e such that filterMap = filterMap’.
 -}

list = [1,2,3,4]
p x = x > 3
f x = x + 2

filterMap p f = filter p . map f

fm p f = foldr aux []
  where 
    aux x xs 
      | p ( f x ) = ( f x ) :xs
      | otherwise = xs
