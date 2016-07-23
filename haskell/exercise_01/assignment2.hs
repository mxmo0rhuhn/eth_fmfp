{-
 - Complex numbers can be represented as pairs of reals: the first 
 - coordinate of a pair represents the real part of the complex 
 - number and the second coordinate represents the imaginary part. In
 - Haskell, we can use pairs of type Double for complex numbers.
 -}

 {- a) 
  - Write functions 
  -
  - re :: (Double, Double) -> Double 
  - im :: (Double, Double) -> Double
  -
  - that return the real part and the imaginary part of a complex 
  - number, respectively.
  -}

re :: (Double, Double) -> Double
re x = fst x

im :: (Double, Double) -> Double
im x = snd x

{- b)
 - Write a function 
 - conj :: (Double, Double) -> (Double, Double) 
 - that conjugates a complex number.
 -}

conj :: (Double, Double) -> (Double, Double) 
conj x = ( re x , (- im x) )

add :: (Double, Double) -> (Double, Double) -> (Double, Double) 
add x y = ( re x + re y , im x + im y ) 

{- c) 
 - Write functions add and mult for addition and 
 - multiplication of two complex numbers, and
 - write a function absv that returns the absolute value of a complex number.
 -}

mult :: (Double, Double) -> (Double, Double) -> (Double, Double) 
mult x y = ( re x * re y - im x * im y , re x * im y + im x * re y ) 

absv :: (Double, Double) -> Double
absv x = sqrt ( ( re x ) ^ 2  + ( im x ) ^ 2 )

{- d)
 - Write a main function with I/O so the user can enter a 
 - complex number and receive its absolute value.
 -}

myMain :: IO ()
myMain = do
  putStrLn "Enter your complex number's real component:"
  real <- getLine
  putStrLn "Enter your complex number's imaginary component:"
  imag <- getLine
  putStrLn ("Your complex number's absolute value is: " ++ show (absv (read (real) :: Double, read (imag) :: Double)))
