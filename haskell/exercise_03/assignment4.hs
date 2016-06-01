{-
 - Write a function 
 - palindromes :: [String] -> [String], 
 - that gets a list l of strings, and
 - returns a list of all strings s = w_1 w_2 
 - where w_1 and w_2 are strings contained in l and s is a
 - palindrome. Example, for the input 
 - ["riseto", "han" , "votesir", "nah", "isetov"] 
 - the output is
 - ["risetovotesir", "hannah", "votesirisetov", "nahhan"].
 - Use only one defining equation and only a list 
 - comprehension as its right-hand side. You may use
 - pre-defined function 
 - reverse :: String -> String .
 -}

palindromes :: [String] -> [String]
palindromes x = [ y ++ z | y <- x, z <- x, reverse y == z || reverse y == tail z || reverse ( init y ) == z]
