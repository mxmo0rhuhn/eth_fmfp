pairSum xs s = [ (x,y) | y <- xs, x <- xs, s == y + x]

interlace xs ys = go xs ys 
  where 
    go [] ys = ys
    go (x:xs) ys = [x] ++ go ys xs 

open = filter (\x -> mod ( numDiv x ) 2 /= 0) [ 1..]
  where 
    numDiv x = length [ d | d <- [1..x], mod x d == 0 ]
