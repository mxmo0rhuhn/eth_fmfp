---- Some examples

gcdint :: Int -> Int -> Int
gcdint x y = gcdiv (abs x) (abs y)

mygcdint x y = gcdiv (myabs x) (myabs y)
  where 
    myabs x
      | x < 0 = x * (-1)
      | otherwise = x

--- renamed as "gcd" already taken in Prelude
gcdiv :: Double -> Double -> Double
gcdiv x y                         
 | x == y      = x
 | y > x       = gcdiv x (y-x)
 | otherwise   = gcdiv (x-y) y

xor x y
 | x == True   = not y
 | x == False  = y

dups n s
 | n == 0      = ""
 | n >  0      = s ++ (dups (n-1) s)
 
silly b (x,y)
    | b            = x + y
    | otherwise    = x * y

fac 0 = 1
fac n = n * fac (n-1)

f1 0 = 0
f1 x = g1 (x-1)

g1 0 = 0
g1 x = 1 + f1 (x - 1)
