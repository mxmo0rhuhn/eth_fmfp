re :: (Double, Double) -> Double
re x = fst x

im :: (Double, Double) -> Double
im x = snd x

conj :: (Double, Double) -> (Double, Double) 
conj x = ( re x , (- im x) )

add :: (Double, Double) -> (Double, Double) -> (Double, Double) 
add x y = ( re x + re y , im x + im y ) 

mult :: (Double, Double) -> (Double, Double) -> (Double, Double) 
mult x y = ( re x * re y - im x * im y , re x * im y + im x * re y ) 

absv :: (Double, Double) -> Double
absv x = sqrt ( ( re x ) ^ 2  + ( im x ) ^ 2 )

myMain :: IO ()
myMain = do
  putStrLn "Enter your complex number's real component:"
  real <- getLine
  putStrLn "Enter your complex number's imaginary component:"
  imag <- getLine
  putStrLn ("Your complex number's absolute value is: " ++ show (absv (read (real) :: Double, read (imag) :: Double)))
