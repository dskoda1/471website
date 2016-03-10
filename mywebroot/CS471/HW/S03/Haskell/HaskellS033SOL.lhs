Modified Fri 4:15pm

You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming. 
          Using different number types in haskell.


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
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellS033SOL
>     where
> import List
 
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
  HaskellF022> unCur mod (4,5)
  4

  HaskellF022> unCur (+) (1,2)
  3

Remember that + is an infix operator. And
 (+) 1 is the function that adds 1 to any Num  i.e. ((+) 1)
  We can say (+) 1 is a partially evaluated function.
  HaskellF022> unCur mod (4,5)
  4


 > unCur :: ?
 > unCur f (x,y) = ?

> unCur f (a,b) = f a b

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
The following function finds the maximum of three integers:

> maxOf3Ints ::  Ord a => a-> a-> a -> a
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

      A) Define maxOf128and2Ints which is the max of two numbers and 128  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    
 > maxOf12and2Ints :: ?

> maxOf12and2Ints =maxOf3Ints 12   


      B) Define maxOf12_32and1Int which is the max of one numbers 
         and 12 and 32
      (use maxOf12and2Ints).  (Place code BELOW --remember ">") Dont forget the type.
      CODE:

 > max12_32and1Int :: ? 
 
> max12_32and1Int =maxOf12and2Ints 32 

      C) Define numberSixteenHundred 
         which is the max  12 32  and  1600  
      (use maxOf12_32and1Int). Dont forget to figure out type
      (Place code BELOW --remember ">")
      CODE:

 > numberSixteenHundred :: ? 
 
> numberSixteenHundred =  max12_32and1Int 1600

Problem 4: (Easy)       
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
> impliesC x y = if x then y else True



   b. Using guards 
  
Code:
 
> impliesG :: Bool -> Bool -> Bool
> impliesG x y
>     | x       = y
>     | otherwise = True




    c. Using a single Boolean expression 
       Boolean operators are:  not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool
> impliesE x y = not x || y




problem 5A:  (easy)  In homework 1 we had the following problem:
      Let  f(x) = 2x + 3
      and   g(x) = 3x + 2


   1.  What is the function composition,  (f o g) (x ) = ?

   2.  What is  (g o f) (x ) = ?

   3.  What is the value of  (f o g) (2 ) = ?

   4.  What is the value of (g o f ) (2 ) = ?

Define f and g in haskell.  What is it's type?
Define h1 and h2 such both will give the same answer (as 1 above). 
h1 should be defined without an argument and h2 should have an argument.
Define h3 and h4 such both will give the same answer (as 2 above). 
h3 should be defined without an argument and h4 should have an argument.
Compare your output with the expected values computed in homework1.

What are the types of h1, h2, h3, h4

> f x = 2 *x +3
> g x = 3 *x +2
> h1 = f . g
> h2 x = 2 * (3 *x +2) +3
> h3 = g . f
> h4 x = 3 * (2 *x + 3) + 2




Problem 5B.
Use only list comprehension notation to define repeatN which creates a list of numbers where
each number is repeated it's number times. ie.

    HaskellS033SOL> take 20 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6]

    HaskellS033SOL> take 30 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,8,8]


> repeatN = [x | x<-[1 ..], y <-[1..x]]  




Problem 6:
A) Write a Haskell function using recursion and function application
   in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and primitive recursion

B) Rewrite using a function application of "reverse"

-- not necessary to use composition

> palindrome :: String -> Bool
> palindrome [] = True
> palindrome [x] = True
> palindrome x = last x == head x && palindrome ((init. tail) x)  



> palindrome1 :: String -> Bool
> palindrome1 x = x == reverse x


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



> occurrence [] = []
> occurrence (e:et) = (e,num) : occurrence next
>     where
>     (num, next) = count e et
>     count e [] = (1, [])
>     count e (h:t) 
>	    | e == h  = (n+1, rest)
>           | otherwise = (n, h:rest)
>        where
>        (n,rest) = count e t



> occurrenceLC xs@(h:hs) = 
>     (h,length [x| x<-xs, h == x]): occurrence [x|x<-hs, h /= x]
> occurrenceLC [] = []
> occurrence2 xs@(h:hs) = 
>     (h,sum [1| x<-xs, h == x]): occurrence2 [x|x<-hs, h /= x]
> occurrence2 [] = []


> occurrenceJim list = [(x,length (elemIndices x list)) | x <- nub list]


Problem ??. (One line wonder is possible)
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

> runningProd  (l:ls)  = ss
>     where ss = l:[ s | s <- zipWith (*) ss ls]

> runProd ls@(h:t) = h:[f | f <- zipWith (*) (runProd ls) (t)]

> runProd2 ls@(h:t) = h : zipWith (*) (runProd2 ls) (t)


Problem 10: 

Define remv to remove every other element from a list.  Use list comprehenstion notation in your solution.

HaskellS033SOL> remv [1 ..20]
[1,3,5,7,9,11,13,15,17,19]
HaskellS033SOL> remv "abcdefghihklmeno"
"acegikmn"


> remv lst = [ e| (e,p)<- zip lst [0 ..], even p]


Problem 11:
Repeat problem 6.  Except each element will be repeat the number of times equal to it's position in the list.  

   HaskellS033SOL> repeatE  "abcde"
   "abbcccddddeeeee"
   HaskellS033SOL> repeatE  [1,3,65,3,2,1,2]
   [1,3,3,65,65,65,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2]


> repeatE lst = [ e | (e,p) <- zip lst [1 ..], y<-[1 ..p]]