> module Hw12
>    where


Problem 1: Define lengths to take a list of lists and returns the length
            of each item.  You should use list comprehension and may use
            length.
        ...> lengths [[12,4,5,6],[1,2,4],[1,2]]
        [4,3,2]

 
Problem 2: Define lengthsM to behave like lengths.  You should use map and
            your definition must be curried.  That is complete the following
            definition.

            lengthsM = ??? ???

Problem 3: Define lengthsF to behave like lengths.  You should use a foldr only
            your definition must be curried.  It will help to use a lamda. 

            lengthsF = ??? ???


Problem 4: (easy)
Write a Haskell script which implements Ackermann's function as defined in 
homework 1.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.
 
ack( m,n ) =	n + 1                           if m = 0
ack( m,n ) =	ack(m - 1, 1)                   if n = 0 and m > 0 
ack( m,n ) =	ack( m-1, ack( m, n-1 ) )      	if n >0 and m > 0


Problem 5:
In Hw11 problem 22 we used the data structure:

> data Tree a = Leaf | Branch a (Tree a) (Tree a)

Now make Tree an instance in the EQ class -- do not use deriving. Below are
some possible test cases. tree1 and tree2 should be equal but not tree3 and tree4.
You may find this helpful: https://en.wikibooks.org/wiki/Haskell/Classes_and_types


> tree1 = Branch 6 (Branch 3 Leaf  (Branch 9 Leaf Leaf))
> tree2 = Branch 6 (Branch 3 Leaf (Branch 9 Leaf Leaf))
> tree3 = Branch 6 (Branch 3 Leaf Leaf) (Branch 9 Leaf Leaf)
> tree4 = Branch 6 (Branch 3 (Branch 9 Leaf Leaf) Leaf)

Example results:
  .... > tree1 == tree1
  True
  .... > tree1 == tree2
  True
  .... > tree3 == tree1
  False
  ...> tree1 /= tree3
  True


Problem 6: Make Tree an instance of the Functor class. You may find this helpful:
https://en.wikibooks.org/wiki/Haskell/The_Functor_class


Problem 7: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 8:  Redo problem above and call the definition sqM.
            Use only map and lambda abstraction. Make sure your answer is "curried"
             - That is complete the statement -- sqM = ??? ???
            

Problem 9:  easy
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

    Hw12> isOrigin (Pt 0 0)
    True  
    Hw12> isOrigin (Pt 3.0 0.0)
    False     
 


  b) Redefine isOrigin (call it isOriginL) using lambda expression only.  

  

Problem 10:
( In Haskell 1 you coded this problem using primative recursion --)
Define a function replicated which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  (Hint use two generators.) i.e.
  ..> replicated [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]




Problem 11:  (List comprehension)
(Only use list comprehension notation )
(From Thompson 17.23)  Give a definition of the function

    factors :: Integral a => a -> [a]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 12: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]
 
a. using explicit recursion and pattern-matching, without guards , call it 'fr'.



b. using explicit recursion and guards, without pattern-matching, call it 'frnp'

c. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion), call it 'fhof'. 

  
Problem 13: Thompson 10.3
  In Hw11 you did the following problem:
  Problem 16: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
Redo the definition. The definition should use a 'fold' and it 
   should be only be one line AND no explicit arguments (i.e. complete
   composeHOF = ?????).


Problem 14: (Thompson 10.13)
  Find functions 'f1' and 'f2' so that
 
   s8 =  map f1 . filter f2

  has the same effect as

(NOTE this was missing in the original assignment MW)
   
  filter (>0) . map (+1)

  ....> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)


Problem 15: 
    Define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases.  Your definition 
   should be a curried (partially evaluated) function. Use a fold in your solution.
   (i.e. Do not have an explicit parameters.  allTrue = ???)
   (Hint: You should use compose operator ('.') to 
    "glue" some of the functions so you don't need explicit parameters.)

Problem 16:

Since foldr :: (a -> b -> b) -> b -> [a] -> b
and (:) :: a -> [a] -> [a]
Predict the type of ... foldr (:) ::
Predict the type of ... foldr (:) [] ::
Predict the result of foldr (:) [] [1,2,3]

Since foldl :: (a -> b -> a) -> a -> [b] -> a
and (:) :: a -> [a] -> [a]
Predict the type of foldl (:)

NOW -- Define reverseL using a fold and lambda expression or helper
function to "glue" the elements together that reverses a list.
e.g.
   ...> reverseL [ ] [1,2,3]
   [3,2,1]




