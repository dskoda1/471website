File 
http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/7hRSpr01.html
Has some review questions

Some things to think about

Prelude> :t map map
map map :: [a -> b] -> [[a] -> [b]]
Prelude> :t map foldl1
map foldl1 :: [a -> a -> a] -> [[a] -> a]
Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]     

Prelude> map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])
[[9,12,15],[1,0,-1]]
(69 reductions, 169 cells)

Prelude> map foldl [(+),(*)]
[foldl (instNum_v35 Num_+),foldl (instNum_v35 Num_*)]
(21 reductions, 99 cells)

Prelude> map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
[4,3000]
(94 reductions, 158 cells)   

Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]
Prelude> (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
[-4,0,-400]
(58 reductions, 113 cells)     

-----------------------------------------------------------------------

What is the value of mapmap ?
 
> mapmap = map (\x-> x [1,2,3])(map map [odd,even])


10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f



What is the output of "take 10 mys1" ?

> mys1 = 1: zipWith (*) mys1 [1..]


--------------------------------------------------------------------------
For the problems below:::
REPLACE
     error "YOU must write the solution here" 
with your solutions.



Do Horner algorithm using primitive recursion

> horner [x] _ = x
> horner (h:t) v =  error "YOU must write the solution here"

do factorial with circle lists.

Write a partition function that goes through a list in one pass and returns 
a tuple (lessLst, moreLst) where lessLst has all the element less than a pivot
and moreLst has all the elements more than a pivot.

> partitionOne [] p = ([],[])
> partitionOne (l:ls) p 
>     | l < p = ?
>     | otherwise = error "YOU must write the solution here"
>     where
>     (less,more) = error "YOU must write the solution here"
> 


This is a "one pass" quicksort.  (This is full code assuming you finish "partitionOne")

> qs [] = []
> qs (x:xs) = qs (less) ++ [x] ++ qs(more)
>      where
>      (less,more) = partitionOne xs x


Define a function, posZneg, that returns a tuple of lists,
    posZneg id list
breaks list into a 3-tuple of list, ([items >id],[items=id],[idea<id]), i.e.

     test> posZneg 0 [10,0,1,-4,-3,0,-4]
     ([10,1], [0,0],[-4,-3,-4])
     test> posZneg 'Z' "bZAaZ"
     ("ba","ZZ","A")

a) What is the most general type of posZneg?

ANSWER: Ord =>a [a]->([a],[a],[a])

b. Define using only HOF

> posZneg1 id l = error "YOU must write the solution here"

c. Define using list comprehensions

> posZneg2 id l =  error "YOU must write the solution here"

d. Use only "primitive" recursion


> posZneg4 id [] = ([], [], [])
> posZneg4 id (l:ls)
>     | l > id =  error "YOU must write the solution here"
>     | l < id =  error "YOU must write the solution here"
>     | otherwise = (as, l:bs, cs)
>     where
>     (as, bs, cs) =  error "YOU must write the solution here"

 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation is valid:

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

>

Problem: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s8 =  map f1 . filter f2

  has the same effect as
 

> p8 = filter (>0) . map (+1)



