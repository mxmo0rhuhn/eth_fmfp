{- The function concatMap :: (a -> [b]) -> [a] -> [b] is defined as:
 -   concatMap f = concat . map f
 - Another possible definition is based on foldr assuming that aux 
 - and e are defined appropriately.
 - Give definitions for aux and e such that concatMap = concatMap’ .
 -}
concatMap' f = foldr aux e
  where
    aux = ( \x b -> (f x ) ++ b)
    e = []
