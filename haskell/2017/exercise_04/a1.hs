import Prelude hiding (Word)

type State = Int
type Alphabet a = [a]
type DFA a = 
  ( Alphabet a             -- alphabet
  , State                  -- initial state
  , State -> a -> State    -- transition function
  , State -> Bool)         -- test for final state
type Word a = [a]

{- a) 
 - Write accessor functions for the various components of the DFA.
 - alphabet :: DFA a -> Alphabet a
 - initial :: DFA a -> State
 - transition :: DFA a -> (State -> a -> State)
 - finalState :: DFA a -> State -> Bool
 - Use these functions in the subsequent parts of the exercises 
 - instead of pattern matching.
 -
 - What is the advantage of using accessor functions?
 -}

alphabet :: DFA a -> Alphabet a
alphabet (a, _, _, _) = a 

initial :: DFA a -> State
initial (_, s1, _, _) = s1

transition :: DFA a -> (State -> a -> State)
transition (_, _, fkt, _) = fkt

finalState :: DFA a -> State -> Bool
finalState (_, _, _, f) = f

{-
   Please shortly indicate why using accessor functions is useful.
   
   Accessor functions in general ease the use of complex datatypes. Therefore one can  
   write the function once and later on use it everytime.                              
                                                                                    
   Futuremore it allows to change datatypes without big impact since only              
   the corrosponding accessors have to be changed (encapsulation).                     
-}

{- b) 
 - Write a function accepts :: DFA a -> Word a -> Bool that returns whether the given
 - automaton accepts the given word.
 - Use a combinator like foldr or foldl instead of explicit recursion.
 -}

accepts :: DFA a -> Word a -> Bool
accepts a w = finalState a (foldl (transition a) (initial a) w) 

lexicon :: Alphabet a -> Int -> [Word a]
lexicon alphabet 0 = [[]]
lexicon alphabet n = [c:w | c <- alphabet, w <- lexicon alphabet (n-1)]

language :: DFA a -> Int -> [Word a]
language a n = [ w | w <- lexicon (alphabet a) n, accepts a w ]

-- Try to use map, foldl, foldr, filter and/or list comprehensions.
