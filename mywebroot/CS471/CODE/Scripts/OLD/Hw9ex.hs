module HW9ex where
import Char

iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

ins :: Ord a => a -> [a] -> [a]
ins x [] = [x]
ins x (y:ys)
    | x <= y = x:(y:ys)
    | otherwise = y : ins x ys

iSortF :: Ord a => [a] -> [a]
iSortF xs = foldr ins [] xs

-- See "exHw9.lhs" for comments
      
allLowerCase::[Char]->[Char]
allLowerCase str = [toLower c | c <- str]

allLowerCaseR :: String -> String
allLowerCaseR (c:cs) = toLower c:allLowerCase cs
allLowerCaseR [] = []


removeR :: Char -> String -> String
removeR r [] = []
removeR r (c:cs)  
  |(c == r) = removeR r cs
  | otherwise = [c] ++ removeR r cs


removeL :: Char -> String -> String
removeL r str = [c | c <- str, c/=r]
removePunctuation = foldr1 (.) [removeL c | c<-",.;:'\"?()!"]


data Shape = Circle Float |
        Rectangle Float Float |
        Square Float

isRound :: Shape -> Bool
isRound (Circle _)      = True
isRound (Rectangle _ _) = False
isRound (Square _)      = False

area :: Shape -> Float
area (Circle r)     = pi*r*r
area (Rectangle h w) = h*w
area (Square s)     = s*s

data Point = Pt Float Float

test x y = [myT ws | ws <- (zip x y) ]

myT (a,b) = a*b













