import System.Exit
{-
  In this assignment you will develop a Haskell 
  program based on Newton’s method for calculating
  the square root of a nonnegative Double. Since 
  the type Double is of limited precision, your
  square root function root :: Double -> Double 
  will compute the square root up to some
  suitably small error eps.
-}

{- 
  Write a function 
  improve :: Double -> Double -> Double 
  that improves your approximation

x  - number whose square root you want to calculate
yn - approximation you have calculated so far
-}

improve :: Double -> Double -> Double
improve x yn = ( ( yn + ( x / yn ) ) / 2 )

{- 
  Write a function 
  goodEnough :: Double -> Double -> Bool 
  that checks whether your approximation is 
  in the error bound eps :: Double.

y     - new approximation
y_old - old approximation
-}
goodEnough :: Double -> Double -> Bool
goodEnough y y_old = abs ( ( y - y_old ) / y_old ) < eps
  where 
    eps = 0.001

{-
  Use the functions improve and goodEnough to write the 
  function root. As the first approximation y 0 you 
  can use, e.g., y 0 = 1.
-}
root :: Double -> Double
root x = aux x y0
  where 
    y0 = 1
    aux x yn 
      | goodEnough ( improve x yn ) yn = improve x yn
      | otherwise                      = aux x ( improve x yn ) 



root_short :: Double -> Double
root_short x = aux x y0
  where 
    y0 = 1
    
    aux x yn 
      | goodEnough y_ yn = y_
      | otherwise        = aux x y_ 
      where
        y_ = improve x yn

{-
 Now extend this to work with I/O. That is, write 
 a main function that asks the user for a
 number to compute the root of. Your main function 
 then prints out the resulting square root
 for positive input, using the definition of root 
 above, and starts over. For negative input
 your program aborts.
-}
main :: IO ()
main = do
  putStrLn "Compute the root of:"
  x <- getLine
  vailid ( convert x )
  main
  where 
    convert x = ( read ( x ) :: Double )
    vailid x
      | x < 0     = exitFailure 
      | otherwise = putStrLn ( "Square root: " ++ show ( root x ) )
