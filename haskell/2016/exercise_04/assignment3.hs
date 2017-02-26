{-
 -a) 
 - The function concatMap :: (a -> [b]) -> [a] -> [b] is defined as:
 - concatMap f = concat . map f
 - Another possible definition is based on foldr assuming that 
 - aux and e are defined appropriately.
 - 
 - concatMap’ f = foldr aux e
 - where aux = ...
 - e
 - = ...
 - 
 - Give definitions for aux and e such that concatMap = concatMap’.
 -}
concatMap' f = foldr aux e
  where
    aux elem list = ( f elem ) ++ list 
-- or aux = \x xs -> f x ++ xs
    e             = []

{- b) 
 - Headache of the week: 
 - Define the foldl function with foldr. Only use λ-abstraction,
 - id, and foldr. Note that id is the identity function, i.e., 
 - id x = x. Your solutions should have the form 
 - myFoldl f v l = foldr ... .
 -}
myFoldl f v l = foldr (\x folded z -> folded (f z x)) id xs ) z 

