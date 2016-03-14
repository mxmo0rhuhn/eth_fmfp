import Data.List

{-
 - The One-Time Pad is a provably secure encryption 
 - scheme provided the key is only used once.
 - A message of length n is encrypted with a key of 
 - the same length by performing a bit-wise XOR.
 - Every bit of the key is set independently of all others 
 - to True with probability 0.5. The encrypted
 - message is decrypted by performing bit-wise XOR with the 
 - same key again. Here we represent
 - messages and keys as lists of Booleans, i.e., 
 - they have type [Bool].
 -}

{- A)
 - Implement a function otp that takes a key 
 - and a message and performs the operation
 - described above. You may assume that the key and the 
 - message always have the same
 - length. Do you see a way to do this using zip and map?
 -}

otp :: [Bool] -> [Bool] -> [Bool]
otp msg key  = map (  \(x , y) -> (x || y) && (not ( x == y))) ( zip msg key )

{- B)
 - Is there a single function that can be used instead of 
 - zip and map here? (Tip: Use www.haskell.org/hoogle to 
 - search for a function with the right type.)
 -}
 
otpFancy :: [Bool] -> [Bool] -> [Bool]
otpFancy msg key  = zipWith (  \x -> \y -> (x || y) && (not ( x == y))) msg key
