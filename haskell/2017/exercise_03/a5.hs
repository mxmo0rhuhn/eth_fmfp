{- 
 - (a) 
 - Define a function split :: Char -> String -> [String] that splits a string, 
 - which consists of substrings separated by a separator, into a list of strings.
 -}
split :: Char -> String -> [String]
split c xs = aux xs []
  where
    aux :: String -> String -> [String]
    aux [] cur = cur : []
    aux (x:xs) cur 
      | c == x = cur : (aux xs [])
      | c /= x = aux xs (cur ++ ( x : [] )) 

{- 
 - (b) 
 - Define a function isASpace :: Char -> Bool that returns True when the character
 - under consideration is a whitespace (just considering ' ' is enough for now). 
 -}
isASpace :: Char -> Bool
isASpace c = c == ' ' 

{- 
 - Define a function toWords :: String -> [String] that takes a string and creates a 
 - list of the words in that string. A word is a string consisting of consecutive 
 - non-whitespace characters (note: a single character is a word already, but at least 
 - one character is required, so no empty words). Whitespace is the delimiter between 
 - words and does not show up in the resulting list.
 -}
toWords :: String -> [String]
toWords xs = filter ( \x -> x /= "") ( split ' ' xs )

{-
 - Define a function countWords :: String -> Int that counts the number 
 - of words in a String.
 -}
countWords :: String -> Int
countWords xs = length (toWords xs)
