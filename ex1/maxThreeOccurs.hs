maxThreeOccurs :: Int -> Int -> Int -> (Int,Int)

maxThreeOccurs n m p = (maxVal, eqCount)
   where maxVal = maxiThree n m p
         eqCount = equalCount maxVal n m p

maxiThree a b c = max a (max b c)

equalCount val n m p = isval n + isval m + isval p
   where isval x = if x == val then 1 else 0
