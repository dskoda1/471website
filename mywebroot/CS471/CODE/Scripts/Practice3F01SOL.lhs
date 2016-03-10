> module Practice3F01SOL where
> import List

Note: The function composition , . , is another example of "polymorphism"
Composition --- glueing functions together!!!



Practice 1:
Rewrite this example:
   map(\x->(x+1)/2) xs
    (i.e 
       Main>  map(\x->(x+1)/2) [2,5,9,12]
       [1.5,3.0,5.0,6.5]
    )
using composition instead of lambda expressions.


> p1 =  map ((/2).(+1)) 


Practice 2:
   map f(map g xs)
Rewrite this using function composition and a single call to map.  

How would rewrite p1 applying p2?

> p2 f g = map (f.g)
> p1R = p2 (/2) (+1)

Practice 3:
What is the type of ys in:
   xs = [1,2,3]::[Float]
   ys = map (+) xs


Practice 4:
What is the principal type of each of the following expressions (if it exists).
    map map
    foldl1 foldl1
    map foldl1
    map . foldl1

What does 

  ....> map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])

evaluate to?

What does 

   ...> map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])

evaluate to?
