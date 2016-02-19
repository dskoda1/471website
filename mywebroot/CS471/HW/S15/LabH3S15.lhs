> module Lab3HS15
>    where

DUE Cinco de Mayo!

You should remove most of the comments when you submit you solutions.  
Your solution should be about a page.


Problem 1:[10pts]
In a previous homework you defined a function composeList which composes 
a list of functions into a single function.
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
Redo this problem using hof. The definition should use a 'fold' and it 
   should be only be one line AND no explicit arguments (i.e. complete
   composeHOF = ?????).


Problem 2: [20 pts]
(from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
In a previous homework your did the following problem using primitive 
recursion.
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

  0 01 0110 01101001 0110100110010110 01101001100101101001011001101001 ...

(if your sequence starts with one..)
    1 10 1001 10010110 1001011001101001...."

...
"Characterization using bitwise negation

The Thue-Morse sequence in the form given above, as a sequence of bits, 
can be defined recursively using the operation of bitwise negation. So, the 
first element is 0. Then once the first 2n elements have been specified, 
forming a string s, then the next 2n elements must form the bitwise negation of 
s. Now we have defined the first 2n+1 elements, and we recurse.

Spelling out the first few steps in detail:

    * We start with 0.
    * The bitwise negation of 0 is 1.
    * Combining these, the first 2 elements are 01.
    * The bitwise negation of 01 is 10.
    * Combining these, the first 4 elements are 0110.
    * The bitwise negation of 0110 is 1001.
    * Combining these, the first 8 elements are 01101001.
    * And so on.
So
    * T0 = 0.
    * T1 = 01.
    * T2 = 0110."
    
Define a explicit recursive function 'thue' given the nth thue sequence returns
the next thue sequence. Then once the first 2**n elements have been specified, 
forming a string s, then the next 2**n elements must form the bitwise negation 
of s. Now we have defined the first 2**(n+1) elements, and we recurse.  


  a) Redefine thue using 'map' instead of explicit recursion. My solution 
     was coded using (++), map, lambda expression and mod.  Call this
     function 'thueMap'.

  b) Define thueSeq which is a sequence of "thue elements" using the circular
     list illustrated in class for fibseq
      (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
       -- Call this function 'thueMapSeq'.  You may use thue OR thueMap in your
       definition of thueMapSeq.
 
     *.......> thueMap [0,1,1,0,1,0,0,1]
      [0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]
     *.......> take 4 thueMapSeq 
      [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1]]




Problem 3. [15 pts]
Since foldr :: (a -> b -> b) -> b -> [a] -> b
and (:) :: a -> [a] -> [a]
Predict the type of ... foldr (:) ::
Predict the type of ... foldr (:) [] ::
Predict the result of foldr (:) [] [1,2,3]

3a) [5pt] Define reverseL using a fold and lambda expression or helper
function to "glue" the elements together that reverses a list.
e.g.
   ...> reverseL [ ] [1,2,3]
   [3,2,1]


Using a fold and/or filter define flattenT that returns a list of
values.  You can use a lambda expression or helper
function to "glue" the elements together.

3b)[5pts] The output should be in the same order 
    as they appear in original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



3c)[5pts] flattenR is the same as 10a, however, the values should appear in
    the reverse order as they appear in the original list.  
    
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]
--------------------


Problem 4: [10pts]
Using a fold in your solution:

a) Define  "allTrue" to evaluate a list of expression of Bools to True if all 
   the expression in a list are true.  Provide two test cases.   Your definition 
   should be a curried (partially evaluated) function.  You should use a 
   'fold'.
   (i.e. Do not have an explicit parameters.  allTrue = ???)  

   

b)  define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases.  Your definition 
   should be a curried (partially evaluated) function.
   (i.e. Do not have an explicit parameters.  nonTrue = ???)
   (Hint: You should use compose to 
    "glue" some of the functions so you don't need explicit parameters.)
    You should use a 'fold'.
    



Problem 5:[10pts] Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
  
   ...> f [1,20,-3,15,2]
   [6,25,20,7]

   Using explicit recursion and pattern-matching, without guards-- OR --
   using explicit recursion with guards but without pattern-matching.  You
   may use explicit arguments.
   



Problem 6:[10pts] (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s7 =  map f1 . filter f2

  has the same effect as
 

> p7 = filter (>0) . map (+1)

 
  ....> p7 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s7 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)

 


Problem 7. [10pts] 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Possible Answers: 




Problem 8:[10pts]   
Define 'prodLtoR nums', that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums  such that last
      value in the output is the product of all the number nums, the next to
      last value in the output is the product of all the numbers in nums 
      except the last value in nums, etc.  
      
   A) Use explicit recursion.
      You may assume the input contains at least one value.  i.e. 
            
    ...> prodLtoR [3,4,1,2,3]
    [3,12,12,24,72]
    
   B)Redo the above by filling in the blanks below.
   
     > prodLtoRHOF  = (.) reverse (foldl op [] )
     >  where
     >   op  [] y = ______________
     >   op  (x:xs) y = ___________


Problem 9: [10pts]  Haskell has a Functor class.
https://wiki.haskell.org/Functor

In the last homework you worked with a data type Tree which will be used
on this assignment.

Given the data type Tree a make it an instance of Functor.

> data Tree a = Leaf  | Node a (Tree a) (Tree a) deriving Show

For example

   ...> fmap even tree1
   Node False (Node True Leaf (Node True Leaf (Node False Leaf Leaf))) Leaf

   ...> fmap (\x-> div x 2) tree1
   Node 2 (Node 5 Leaf (Node 6 Leaf (Node 7 Leaf Leaf))) Leaf

> tree1 = Node 5 (Node 10 Leaf (Node 12 Leaf (Node 15 Leaf Leaf) ) ) Leaf
> tree2 = Node 5 (Node 10 Leaf (Node 99 Leaf (Node 15 Leaf Leaf) ) ) Leaf
> tree3 = Node 5 (Node 10 (Node 12 Leaf (Node 15 Leaf Leaf) ) Leaf ) Leaf


Problem 10: [10pts] (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions .  You may include your
       merge defined in a previous HW.

(Hint: Apply the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)) 
           
> factors2 :: Integer -> [Integer]
> factors2 x = 1:[a | a<-[2..(div x 2)], (mod x a) == 0] ++ [x]


