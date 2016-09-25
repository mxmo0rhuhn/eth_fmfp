{- 
 - Formulas in propositional logic are built from variables of type a, 
 - negation, conjunctions, and disjunctions.
 -}

{- 
 - (a) Specify a Haskell data type Prop a to represent formulas in 
 - propositional logic. The constructors should be called 
 - Var, Not, And, and Or.
 -}

data Prop a = Var a | Not (Prop a) | And (Prop a) (Prop a) 
              | Or (Prop a) (Prop a)

{- 
 - (b) Implement a Haskell function foldProp that folds a proposition using 
 - separate folding functions for variables, negations, conjunctions, and 
 - disjunctions. The arguments of foldProp must be in that order.

foldProp Var Not And Or (Var "x") 
=> should evaluate to Var "x" 
foldProp Var Not And Or (Not (Var 0)) 
=> should evaluate to Not (Var 0) 
foldProp Var Not And Or (And (Or (Var True) (Var False)) (Var False)) 
=> should evaluate to And (Or (Var True) (Var False)) (Var False) 
foldProp id negate (*) (+) (Var 10) 
=> should evaluate to 10 
foldProp id negate (*) (+) (And (Var 2) (Var 3)) 
=> should evaluate to 6 
foldProp id negate (*) (+) (Or (And (Var 7) (Var 5)) (Or (Not (And (Var 3) (Var 2))) (Var 1))) 
=> should evaluate to 30 
 
 -}

{- 
 - (c) Implement a Haskell function evalProp :: (a -> Bool) -> Prop a -> Bool 
 - using the foldProp function from (b) such that evalProp v p evaluates the 
 - formula p under the variable assignment v.
 -}
evalProp :: (a -> Bool) -> Prop a -> Bool 

{- 
 - (d) Implement a function propVars :: Eq a => Prop a -> [a] using the 
 - foldProp function from (b) such that propVars p computes the list of 
 - variables occuring in formula p. Make sure that each variable occurs only 
 - once in the list.
 -}
propVars :: Eq a => Prop a -> [a]


{- 
 - (e) Implement a function satProp :: Eq a => Prop a -> Bool that checks 
 - whether a given formula is satisfiable, i.e., whether there is a variable 
 - assignment under which the formula evaluates to True.
 - Note: Your implementation does not need to be efficient.
 -}
satProp :: Eq a => Prop a -> Bool

{- 
 - (f) Instantiate the type class Show for propositional formulas. Variables 
 - should be printed without Var and And and Or should be displayed infix as 
 - && and ||. Enclose all non-atomic subformulas in parentheses.
 - Example: show (Not (And (Var ’A’) (Var ’B’))) = "(Not (’A’ && ’B’))"
 -}
