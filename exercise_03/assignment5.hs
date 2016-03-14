{- A)
 - Define a function 
 - split :: Char -> String -> [String] 
 - that splits a string, which
 - consists of substrings separated by a separator, 
 - into a list of strings. Examples:
 -
 - split ’#’ "foo##goo" = ["foo","","goo"]
 - split ’#’ "#" = ["",""]
 -}
split :: Char -> String -> [String]
split string pattern
  | [] _      = []
  | _  ""     = string
  | otherwise = aux [] sting pattern
    where
     aux cur rem p
       | head rem = p 



{- B)
 - Define a function 
 - isASpace :: Char -> Bool 
 - that returns True when the character un-
 - der consideration is a whitespace (just 
 - considering ' ' is enough for now).
 - Define a function 
 - toWords :: String -> [String] that takes 
 - a string and creates a
 - list of the words in that string. A word is 
 - a string consisting of consecutive non-whitespace
 - characters (note: a single character is a word 
 - already, but at least one character is required,
 - so no empty words). Whitespace is the delimiter 
 - between words and does not show up in
 - the resulting list. Examples:
 -
 - toWords "This is a sentence." = ["This","is","a","sentence."]
 - toWords " lots of white    " = ["lots","of","white"]
 -}
isASpace :: Char -> Bool
isASpace = undefined

toWords :: String -> [String]
toWords = undefined


{-
 - Define a function 
 - countWords :: String -> Int that counts the 
 - number of words in a String.
 -}
countWords :: String -> Int
countWords = undefined
