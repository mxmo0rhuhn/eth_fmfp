dvdNxt :: [Int] -> [Int]
dvdNxt x = aux x
  where 
    aux [] = []
    aux (x:[]) = [x]
    aux (x:y:xs)
      | mod y x == 0   = [x] ++ aux (y:xs)
      | otherwise      = aux (y:xs)


stableDN :: [Int] -> [Int]
stableDN x = aux x (dvdNxt x)
  where 
    aux xs ys 
      | length xs == length ys = ys
      | otherwise              = aux ys (dvdNxt ys)

prepend :: String -> [[String]] -> [String]
prepend s (x:xs) = [s ++ e | e <- x] ++ prepend s xs
prepend s [] = []
