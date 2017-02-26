-- write your implementation of complex numbers here

-- Write functions re :: (Double, Double) -> Double and im :: (Double,
-- Double) -> Double that return the real part and the imaginary part of a complex
-- number, respectively.
re :: (Double, Double) -> Double
re (x, y) = x

im :: (Double, Double) -> Double
im x = snd x

-- Write a function conj :: (Double, Double) -> (Double, Double) that
-- conjugates a complex number.
conj :: (Double, Double) -> (Double, Double)
conj (x, y) = (x, -y)

-- Write functions add and mult for addition and multiplication of two complex
-- numbers, and write a function absv that returns the absolute value of a complex
-- number.

add :: (Double, Double) -> (Double, Double) -> (Double, Double)
add (x, y) (a, b) = (x + a, y + b)

mult :: (Double, Double) -> (Double, Double) -> (Double, Double)
mult (x, y) (a, b) = (x*a - y*b, x*b + y*a)

absv :: (Double, Double) ->  Double
absv (x, y) = sqrt( x * x + y * y)

myMain :: IO ()
myMain = undefined

