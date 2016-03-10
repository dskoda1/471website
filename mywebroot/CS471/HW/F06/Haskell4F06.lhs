> module Haskell4F06
>     where
>     import List

Reading:
Scott Chapter 10: 
   523-527,539-595
   Check your understanding: Chapter 10: 1-4,9, 
    (What characteristics of Lisp are, inaccurately,  
     described as though they pertained to functional programming
     in general?). 12-21

Practice:
What does [1 ,3 .. 100] generate?
What does [100 , 97 .. 1] generate?
what is "and" ?

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


What is the value of mapmap ? Try and figure it out then run it.

 
> mapmap = map (\x-> x [1,2,3])(map map [odd,even])

________________________________________________
Problem 1:
The function determines if a String is a palindrome, i.e. the string and the
reverse of the string are the same.

a) Write a recursive Haskell function in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses a combination of 
                      boolean expressions, head, last, init, tail 
                      and explicit recursion. You may use (.)



b) Rewrite using a function application of "reverse".  This
   is a one line wonder.



Problem 2:
Write a Haskell function, palindromic.
The function determines if this list of strings is palindromic 
IN THE FOLLOWING SENSE: If you reverse the list AND, as you do that, 
                        you also reverse each string in the list, 
                        then that should be equal to the original list, e.g.
palindromic ["abc", "def", "ghg", "fed", "cba"] returns True
since the reverse of reversed strings is ["abc", "def", "ghg", "fed", "cba"] 

palindromic ["abc", "def", "ghig", "fed", "cba"] returns False
since the reverse of reversed strings is ["abc", "def", "gihg", "fed", "cba"] 

palindromic ["abc", "def", "ghg", "fred", "cba"] returns False
since the reverse of reversed strings is ["abc", "derf", "ghg", "fed", "cba"] 

You should return the value of a boolean expression if the list 
contains more than one element.  You should not be using HOF, 
list comprehension. The explicit recursion should be part of a boolean expression.  
If there is only one element then your solution can return the value of palindrome 
applied to the element.


 > palindromic :: [String] -> Bool
 > palindromic [] = 
 > palindromic [x] =
 > palindromic xs = 


Problem 3:
Repeat problem 2: Try using a boolean expression and a combination of
                 "reverse," "zipWith,". "map" and "and"

   > palindromic1 :: [String] -> Bool
   > palindromic1 x =




Problem 4: 
Problem 1) Recode the following explicit recursive definition using 
           function application of one of fold functions.

> composeList1 [] = id
> composeList1 (h:t) = h . composeList1 t


Problem 5: Rewrite new definitions of this function:


> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
 
a. using explicit recursion and pattern-matching, without guards. OR
   using explicit recursion and guards, without pattern-matching.



b. using higher-order functions, function composition, lambda expressions or
   function application (NO explicit recursion) and no explicit arguments.



Problem 6:

a) (T9:11) How would you define the sum of the squares of the natural numbers 1 to n 
using map and foldr?


 
b) How would you define the sum of the squares of a list of integers
using map and foldr and (.).  You will have NOT explicit arguments.  







Problem 7: 

For the purposes of this exercise you should use foldr1 to give definition of the 
prelude function last.  Use foldr to give the definition of prelude function
unzip.

  > unzipR =
  > lastR =




Problem 8: (Note: do not specify the argument for problem 8)
 8a: Use map to define a  lengths that takes a list of lists and
returns a list of corresponding langths. i.e.

  Haskell4F06> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  




 8b: Use map and a "fold" to define  sumLengths that takes a
list of lists and returns the sum of all their lengths. i.e.
  
  Haskell4F06> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

  > sumlengths = 



Problem 9: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s9 =  map f1 . filter f2

  has the same effect as
 

> p9 = filter (>0) . map (+1)

 
  Haskell2S04> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  Haskell2S04> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)



Problem 10. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells




Problem 11:
Using a fold in your solution:

a) define "allTrue"  which evaluates to True if all the expression in
   a list are true.  Provide two test cases. 



b)  define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases



