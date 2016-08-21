psum :: [Integer] -> [Integer]
psum [] = []
psum xs = 0 : (aux 0 xs)
  where 
    aux n [] = []
    aux n (x:xs) = (x + n) : (aux (x+n) xs)
