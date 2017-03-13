-- Write a function palindromes :: [String] -> [String] , that gets a 
-- list l of strings, and returns a list of all strings s = vw where 
-- v and w are strings contained in l and s is a palindrome. 

-- Example, for the input [riseto, han, votesir, nah, isetov] ,
-- the output is [risetovotesir, hannah, votesirisetov, nahhan] . 
-- Use only one defining equation and only a list comprehension 
-- as its right-hand side. You may use pre-defined function 
-- reverse :: String -> String

palindromes :: [String] -> [String] 
palindromes xs = [ x ++ y | x <- xs, y <- xs, (((reverse x) == y) || ((reverse (init x)) == y) || ((reverse x) == (tail y)))]
