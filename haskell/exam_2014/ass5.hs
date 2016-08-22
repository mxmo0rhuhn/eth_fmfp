data FSEntry = Folder String [FSEntry] | File String String

test = Folder "Home" 
            [ Folder "Work" 
                [File "students.txt" "Alice, Bob",
                 File "hint" "You can use fFSE!"],
             File "Fun" "FMFP"]

fFSE :: (String -> [a] -> a) -> (String -> String -> a) -> FSEntry -> a
fFSE folderfkt filefkt = go
  where 
    go (Folder name entries) = folderfkt name [ go entry | entry <- entries ]
    go (File name content) = filefkt name content

number :: FSEntry -> Int
number x = fFSE (\x y -> sum y + 1) (\x y -> 1) x

count :: Char -> FSEntry -> Int
count ch fs = fFSE (\x y -> sum y) (\x y -> length (filter (\x -> x == ch) y)) fs

prepend :: String -> [[String]] -> [String]
prepend p xss = [ p ++ x | xs <- xss , x <- xs ]

paths :: FSEntry -> [String]
paths (File name x) = [name]
paths (Folder name files) = prepend (name++"/") [paths x | x <- files]
