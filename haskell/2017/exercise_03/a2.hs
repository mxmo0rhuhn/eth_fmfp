-- The One-Time Pad is a provably secure encryption scheme provided 
-- the key is only used once. A message of length n is encrypted with 
-- a key of the same length by performing a bit-wise XOR . Every bit 
-- of the key is set independently of all others to True
-- with probability 0.5. The encrypted message is decrypted by performing 
-- bit-wise XOR with the same key again. Here we represent messages 
-- and keys as lists of Booleans, i.e., they have type [Bool] .

import Data.Bits
-- xor would be
-- xor :: Bool -> Bool -> Bool
-- xor a b 
--   | a == b = False
--   | otherwise = True

-- Implement a function otp that takes a key and a message and performs the
-- operation described above. You may assume that the key and the message
-- always have the same length.

otp :: [Bool] -> [Bool] -> [Bool]
otp x y = map (uncurry xor) ( zip x y )

-- Is there a single function that can be used instead of zip and map here?
otp2 :: [Bool] -> [Bool] -> [Bool]
otp2 x y = zipWith xor x y 
