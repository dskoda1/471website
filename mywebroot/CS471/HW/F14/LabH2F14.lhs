> module LabH2F14
>    where

problem 1&2:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)

 

  2c:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.  (Tricky)
  

Problem 3: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 4:
Define a function replicated which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  (Hint use two generators.) i.e.
  ..> replicated [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]



Problem 5: (easy)
Write a Haskell script which implements Ackermann's function as defined in 
homework 1.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.
 
ack( m,n ) =	n + 1                           if m = 0
ack( m,n ) =	ack(m - 1, 1)                   if n = 0 and m > 0 
ack( m,n ) =	ack( m-1, ack( m, n-1 ) )      	if n >0 and m > 0



Problem 6:  easy
Point is a data type that represents a point in a plane and 
the coordinate type should be in class Eq.

> data Point a = Pt a a deriving (Show, Eq)

   > :t Pt 0 0
   Pt 0 0 :: Num a => Point a
   > :t Pt 'a' 'b'
   Pt 'a' 'b' :: Point Char


  Now define a function "isOrigin" that returns true if the point is the origin 
  and false otherwise.  
  > isOrigin :: (Eq a, Num a) => Point a -> Bool

    LabH2F14> isOrigin (Pt 0 0)
    True  
    LabH2F14> isOrigin (Pt 3.0 0.0)
    False     
 


  b) Redefine isOrigin (call it isOriginL) using lambda expression only.  


  
  







