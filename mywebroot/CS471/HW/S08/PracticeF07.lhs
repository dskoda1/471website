> module PracticeF07
>     where

Practice and experimenting:
(Do not turn or print out the practice and experimenting section)

1) In Homework 4 you where given the problem to write powerset in Prolog.  
Now code it Haskell.

2) What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> product [1..10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> takeWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"


3) That is the inferred type of:
  ...>:t ((-1)*)
  ...>:t ((+1)*)

4) Suppose that the following defintions are made:
  > x, y :: Int
  > x = 5
  > y = 8
  > nss :: [[Int]]
  > nss = [[10,20],[4,0,3]]
  > ps :: [(Int,Bool)]
  > ps = [(103,True), (200,False), (401,False), (17, True), (22, True)]
  > qs :: [Int]
  > qs = [ y+1 | (y,z) <- ps, odd y, y < 300 ]
  > what :: [a] -> Int
  > what (x:xs) = 10
  > what (y:w:zs) = 20
  > what ws = 30
Give the values of the following expressions.
(A) [x..y]
(B) [2,5..12]
(C) qs
(D) fst("abc",y)
(E) (x == y, [x])
(F) []:nss
(G) [nss]
(H) what nss
(I) what [[]]


You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u

Remember you can orint no. reductions/cells after eval by setting "s"
   :s +s

What is the type of
   uncurry
What does it do?

What is the value of
   uncurry (+)

Keep working figuring out the inferred type:

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])
    
    
