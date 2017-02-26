{-
  Write a Haskell function 
    cntChange :: Int -> Int 
  that computes the number of ways to
  change any given amount of money 
  (expressed in Rappen) by using CHF coins.
  Hint: Think recursively. The number of ways 
  to change amount a using n different kinds of
  coins is equal to the sum of
  - the number of ways to change a using all but 
    the first kind of coin, and
  - the number of ways to change amount a − d using 
    the n kinds of coins, where d is the
    denomination of the first kind of coin
-}

cntChange :: Int -> Int 
cntChange amt
  | amt = 0            = 1 -- just to make the test pass! I don't belive that there is a way to give somebody CHF 0 in coins ... as giving in coins should involve at least one coin
  | amt < 5            = 0
  | ( mod amt 5 ) /= 0 = 0
  | otherwise          = change amt rappen
  where
    rappen = [ 500, 200, 100, 50, 20, 10, 5 ] 
    change _ []   = 0
    change amt (x:xs)
      | amt < 0   = 0
      | amt == 0  = 1
      | otherwise = ( change amt xs ) + ( change ( amt - x ) ( x:xs ) )
