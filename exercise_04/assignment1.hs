import Prelude hiding (Word)

{-
 -In this exercise, we consider deterministic finite automata (DFA). 
 - A DFA (Q, Σ, q 0 , δ, F ) over an alphabet Σ consists of a 
 - finite set of states Q, an initial state q_0, a transition 
 - function δ : Q × Σ → Q and a set of final states F. 
 -
 - The transition function is extended from letters to words 
 - (i.e., finite lists of letters) as usually: 
 - δ(q, [ ]) = q and δ(q, x : w) = δ(δ(q, x), w). 
 - The automaton accepts a word w iff δ(q 0 , w) ∈ F . 
 - We assume that the letters are taken from some unspecified 
 - type a. We represent the states as integers and leave the set 
 - of states implicit.
 -}

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
alphabet (a, _,_,_) = a

initial :: DFA a -> State
initial (_, a,_,_) = a

transition :: DFA a -> (State -> a -> State)
transition (_, _, a,_) = a

finalState :: DFA a -> State -> Bool
finalState (_, _, _, a) = a

{-
 - Please shortly indicate why using accessor functions is useful:
 -
 - Accessor functions in general ease the use of complex datatypes. Therefore one can 
 - write the function once and later on use it everytime.
 -
 - Futuremore it allows to change datatypes without big impact since only
 - the corrosponding accessors have to be changed (encapsulation).
-}

{- b) 
 - Write a function accepts :: DFA a -> Word a -> Bool that returns whether the given
 - automaton accepts the given word.
 - Use a combinator like foldr or foldl instead of explicit recursion.
 -}

accepts :: DFA a -> Word a -> Bool
accepts dfa w = ( finalState dfa ( foldl ( transition dfa ) ( initial dfa ) w ) ) 

{- c) 
 - Write a function lexicon :: Alphabet a -> Int -> [Word a] that returns all words
 - over the alphabet of the given length. For example, for the alphabet of the characters
 - ’a’ and ’b’, we have lexicon "ab" 0 = [""] and lexicon "ab" 2 = ["aa", "ab",
 - "ba", "bb"]. The order of the words does not matter. There must not be duplicate words
 - unless the given alphabet contains duplicate letters.
 -
 - TODO: 
 - lexicon "" 0 should evaluate to [""] : failed got [] 
 - lexicon "ab" 0 should evaluate to [""] : failed got [] 
 -}

lexicon :: Alphabet a -> Int -> [Word a]
lexicon a n 
  | n == 0   = []
  | otherwise = aux (n-1) a ( foldl (\w c -> [c] : w ) [] a )
    where 
      aux :: Int -> Alphabet a -> [Word a] -> [Word a]
      aux n alphabet words
        | n == 0    = words 
        | otherwise = aux (n-1) alphabet ( addChar alphabet words )
      addChar :: Alphabet a -> [Word a] -> [Word a]
      addChar [] words     = []
      addChar (x:xs) words = map (\y -> x : y ) words ++ addChar xs words

{-d) 
 - Write a function language :: DFA a -> Int -> [Word a] that outputs the list of all
 - words of the given length accepted by the given automation.  
 - language :: DFA a -> Int -> [Word a] 
 - language = undefined
 -}

language :: DFA a -> Int -> [Word a]
language a n = filter (accepts a ) ( lexicon ( alphabet a ) n )

-- Try to use map, foldl, foldr, filter and/or list comprehensions.
