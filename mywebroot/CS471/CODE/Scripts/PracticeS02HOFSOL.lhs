> module PracticeS02HOF where
> import List

Note: The function composition , . , is another example of "polymorphism"
Composition --- glueing functions together!!!



Practice 1:

> p1 = map(\x->(x+1)/2) 


What does  
  p1 xs do?








Rewrite this example:
    p1 = map(\x->(x+1)/2)
using composition instead of lambda expressions.

> p2 = map ((/2).(1+)) 



Practice 2:
What does 
   map f(map g xs)
do?


Rewrite this using function composition and a single call to map.  

How would rewrite p1 applying p2?

> p3 = map (f . g)
> p1r = p3 (/2) (1+)


Practice 3:
What is the type of ys in:
   xs = [1,2,3]::[Float]
   ys = map (+) xs

Prelude> :t map (+) ([1,2,3]::[Float])
map (+) [1,2,3] :: [Float -> Float]  

Practice 4:
What is the principal type of each of the following expressions (if it exists).
    map map
    foldl foldl
    map foldl1
    map . foldl1



Describe each of the following infinite lists.

xs = 1:map(*2) xs
