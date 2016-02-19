Modified Wed 8:10pm

You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Practice primitive recursive functions 
          practice using list comprehension to define functions
          practice using partially evaluated functions (curried functions)
          see the use of compose function (.)
          anonymous function (lambda functions)
          keep learning about types.


Note: In the homework file put only one space between ">" and the code.  
Do not use a tab...  JUST one SPACE.

  A) Continue to examine, via your text editor, 
     the Prelude.hs file that comes with your hugs. 
     What is the purpose of the file? 
     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  
     (Prelude.hs is in the lib directory.  Use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)
  B) What is the ype of lF, and what does it do?
 
  c) Give an example of a partially evaluated functions.
  D) What does the following evaluate to?  (IMPORTANT)
     (\x y -> x * y) 2 3 
     (\x y ->  x y) (\x -> (-) x) 4 5

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
For all the code you write you should try to figure out the most general type.

YOUR NAME, EMAIL

> module HaskellS033
>     where

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)



Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
       > function arg = ?
  or 
       > function arg

I have also indicated if you should put the type by including a line
      > function :: ?
You should try to figure out the most general type that will work.

Because of these "?"  you will get errors when you load this file into 
hugs.




Problem 1: (Easy) Write a script unCur that takes a function and a pair and returns the value: 
i.e.  
  HaskellS033> unCur mod (4,5)
  4

  HaskellS033> unCur (+) (1,2)
  3

Remember that + is an infix operator. And
 (+) 1 is the function that adds 1 to any Num  i.e. ((+) 1)
  We can say (+) 1 is a partially evaluated function.
  HaskellS033> unCur mod (4,5)
  4
Do not use any build function.

> unCur :: ?
> unCur f (x,y) = ?



Problem 2: 
   Write a Haskell definition,whose output will be
   a tuple (sum,prod) where sum is the sum of all the elements in the list
   and prod is the product of all the elements in the list. Do this using 
   primitive recursion.  What is the most general type? 
i.e:
   HaskellS033> sumProduct[1,2,3,4,5]
   (15,120)
   HaskellS033> sumProduct[1.5,2.5,3.5,(-2)]
   (5.5,-26.25)



> sumProduct :: ?
> sumProduct (n:ns) = ? 
     




Problem 3: (Easy)
The purpose of this problem is to understand partically evaluated functions can be used for encapsulation.
There is nothing hard about this problem.
The following function finds the maximum of three integers:

> maxOf3Ints :: Ord a => a-> a-> a -> a
> maxOf3Ints x y z
>     | x >= y && x >= z = x
>     | y >= z           = y
>     | otherwise        = z 




Derive using previously defined functions (for this problem), 
the following functions. Include as a comment the inferred type 
of the new function. 
You find out the type by the command  ":t".
    For example:
    Define maxOf which is the max of two numbers and 21  
    (use maxOf3Ints). NOTE there are no arguments.  
(WHAT IS THE TYPE OF maxOf3Ints ?)

> maxOf21and2Ints = maxOf3Ints 21

      A) Define maxOf12and2Ints which is the max of two numbers and 12  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    
> maxOf12and2Ints :: ??
> maxOf12and2Ints 


      B) Define maxOf12_32and1Int which is the max of one numbers 
         and 12 and 32
      (use maxOf12and2Ints).  (Place code BELOW --remember ">") Dont forget to figure out the most general type.
      CODE:

> max12_32and1Int :: ? 
> max12_32and1Int ?

      C) Define numberSixteenHundred 
         which is the max  12 32  and  1600  
      (use maxOf12_32and1Int). Dont forget to figure out the most general type
      (Place code BELOW --remember ">")
      CODE:

> numberSixteenHundred :: ? 
> numberSixteenHundred ?

Problem 4: (Easy)       
The purpose of this problem is to see how to use logical operators vs the "if" statement.
   The function "implies"  takes tow Boolean arguments and returns a
   Boolean Result.  
   Its truth table is:
      x       y         implies x y
      True    True         True
      True    False        False
      False   True         True
      False   False        True



 Define implies three ways:
   a. Using conditional expression (if..then...else)

   Code:
 
> impliesC :: Bool -> Bool -> Bool
>


   b. Using guards 

   Code:
 
> impliesG :: Bool -> Bool -> Bool




    c. Using a single Boolean expression 
       Boolean operators are:  not, &&, ||

    Code:

> impliesE :: Bool -> Bool -> Bool 
>



problem 5:  (easy)  In homework 1 we had the following problem:
      Let  f(x) = 2x + 3
      and   g(x) = 3x + 2


   1.  What is the function composition,  (f o g) (x ) = ?

   2.  What is  (g o f) (x ) = ?

   3.  What is the value of  (f o g) (2 ) = ?

   4.  What is the value of (g o f ) (2 ) = ?

Define f and g in haskell.  What is it's type?
Define h1 and h2 such both will give the same answer (as 1 above). 
h1 should be defined without an argument and h2 should have an argument.
h2 should not just be the definition f ( g x) but reflect in hw 1.
Define h3 and h4 such both will give the same answer (as 2 above). 
h3 should be defined without an argument and h4 should have an argument.
Compare your output with the expected values computed in homework1.

What are the types of h1, h2, h3, h4

> f x =
> g x =
> h1 =
> h2 x =
> h3 =
> h4 x =


Problem 5.
Use only list comprehension notation to define repeatN which creates a list of numbers where
each number is repeated it's number times. ie.
i.e. 
    HaskellS033SOL> take 20 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6]

    HaskellS033SOL> take 30 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,8,8]


  
> repeatN =

Problem 6:
A) Write a Haskell function using recursion and function application
   in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and primitive recursion

B) Rewrite using a function application of "reverse"


Problem 7&8:
Define a functions occurrences so that "occurrences" xs 
    returns a list containing 
  one copy of each element of xs paired with the number of times it occurs. i.e
   occurrences [5,2,3,2,4,3,2,5] ~> [(5,2), (2,3), (3,2), (4,1)]

Don't restrict yourself to a single function definition -- consider using 
auxiliary functions to break the task into simpler subtasks.

There will be two versions:
    occurrences7 
      version will use explicit recursion and function application only.
    occurences8
      version will use list comprehensions as much as possible.


Problem 9. (One line wonder is possible)
Using the ideas presented in computing the nth Fibonacci
number with infinite list structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html#Fib) 
define 
   > runningProduct list

   which calculates a running product, i.e.
   [ a0, a0 * a1, a0 * a1 * a2, ...

   from a list, [a0, a1, a2, ...

   ...> runningProduct [1 ..10]
   [1,2,6,24,120,720,5040,40320,362880,3628800]
   (332 reductions, 647 cells)


Problem 10: 
(Not too hard)
Define remv to remove every other element from a list.  Use list comprehenstion notation in your solution.

  HaskellS033SOL> remv [1 ..20]
  [1,3,5,7,9,11,13,15,17,19]
  HaskellS033SOL> remv "abcdefghihklmeno"
  "acegikmn"


> remv lst = ?


Problem 11:
Repeat problem 6.  Except each element will be repeat the number of times equal to it's position in the list.  

   HaskellS033SOL> repeatE  "abcde"
   "abbcccddddeeeee"
   HaskellS033SOL> repeatE  [1,3,65,3,2,1,2]
   [1,3,3,65,65,65,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2]