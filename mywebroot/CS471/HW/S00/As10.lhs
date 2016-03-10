YOUR NAME, Email

	Haskell: The Craft of Functional Programming
	Simon Thompson
	(c) Addison-Wesley, 1999.

	Chapter 7

> module HW10 where
> import Prelude hiding (getLine)

We are just using a subset of Simon Thompson's code from chapter 7

To join two strings

> joinStrings :: (String,String) -> String
> joinStrings (st1,st2) = st1 ++ "\t" ++ st2



Example: Text Processing
^^^^^^^^^^^^^^^^^^^^^^^^

The `whitespace' characters.

> whitespace :: String
> whitespace = ['\n','\t',' ']

Get a word from the front of a string.

> getWord :: String -> String
> getWord []    = [] 
> getWord (x:xs) 
>     | elem x whitespace   = []
>     | otherwise           = x : getWord xs

In a similar way, the first word of a string can be dropped.

> dropWord :: String -> String
> dropWord []    = []
> dropWord (x:xs) 
>     | elem x whitespace   = (x:xs)
>     | otherwise           = dropWord xs

To remove the whitespace character(s) from the front of a string.

> dropSpace :: String -> String
> dropSpace []    = []
> dropSpace (x:xs) 
>     | elem x whitespace   = dropSpace xs
>     | otherwise           = (x:xs)

A word is a string.

> type Word = String

Splitting a string into words.

> splitWords :: String -> [Word]
> splitWords st = split (dropSpace st)

> split :: String -> [Word]
> split [] = []
> split st
>     = (getWord st) : split (dropSpace (dropWord st))

Splitting into lines of length at most lineLen

> lineLen :: Int
> lineLen = 80

A line is a list of words.

> type Line = [Word]

Getting a line from a list of words.

> getLine :: Int -> [Word] -> Line
> getLine len []     = []
> getLine len (w:ws)
>     | length w <= len     = w : restOfLine  
>     | otherwise           = []
>     where
>     newlen      = len - (length w + 1)
>     restOfLine  = getLine newlen ws

Dropping the first line from a list of words.

> dropLine :: Int -> [Word] -> Line

> dropLine = dropLine 	-- DUMMY DEFINITION

Splitting into lines.

> splitLines :: [Word] -> [Line]
> splitLines [] = []
> splitLines ws
>     = getLine lineLen ws
>           : splitLines (dropLine lineLen ws)

To fill a text string into lines, we write

> fill :: String -> [Line]
> fill = splitLines . splitWords


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
PROBLEMS-----------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

3) Horner's rule is an algorithm to evaluate a polynomial without 
requiring the computation of arbitrary powers of x. 
We can represent the coefficients of a polynomal 
     an x^n + an-1 x^(n-1) +...+ a0 using a 
     list = [  an, an-1, ...,  a0 ].

horner coef x
CODE HERE:

>

      -----------------------------------------------------------
4) Using a list represention of a set write a script that returns the 
   powerset (represented as a list of lists) of the set.
        ... > powerSet [1,2,3]
        [[1,2,3],[2,3],[1,3],[3],[1,2],[2],[1],[]]

powerSet Set
CODE HERE:

>

     -------------------------------------------------------------
Problems from text

The following problems are from Thompson, pages 128 -133.  

  #5 7.24 Design a function
           wc :: String -> (Int, Int, Int)
        which when given a text string returns the number of characters, 
        words and lines in the string.  The end of a line in the string 
        is signalled by the new line character,  ('\n').
CODE HERE:

>


  #6 7.26 Design a function
           subst :: String -> String -> String -> String
        so that
           subst oldSub newSub st
        is the result of replacing the first occurrence in st of the 
        substring oldSub by the substring newSub. For instance,
           subst "much " "tall " "how much is that?" 
               = "How tall is that?"
        If the substring oldSub does not occur in st, the result should be st.

Code HERE:

>

7) Write a Haskell script using list comprehension,  
    zipAllPairs lst1 lst2, 
   which returns a list of pairs. You do not need to have your program work 
   for  the empty list i.e. zipPair [] [1,2,3]
    ...> zipPair [1,2,3] ['a','b']
    [(1,'a'),(1,'b') (2,'a'),(2,'b'),(e,'a') (3,'b')]

CODE HERE:

>


8) Write a Haskell script, prodPair lst1 lst2,using zipPair 
   from homework 9 and list comprehension to create a product of two lists.
    ...> prodPair [1,2] [11,12,100]
    [11,24]

Code here

> zipPair lst1 lst2 = [] --- DUMMY DEFINITION
>



9) Write a Haskell script using list comprehension, numToBool lst, 
   that goes through a list of numbers and produces a Bool list.
        ...> numToBool [1,3,2,4]
        [False, False, True, True]
CODE HERE:

>


10) Write a Haskell script using list comprehension, list all 
   Pythagorean triples starting from 1 to 50
      ...> pyth 
      [(3,4,5),(5,12,13),(6,8,10),(7,24,25),(8,15,17),(9,12,15),(9,40,41),
       (10,24,26),(12,16,20),(12,35,37),(14,48,50),(15,20,25),(15,36,39),
       (16,30,34),(18,24,30),(20,21,29),(21,28,35),(24,32,40),(27,36,45),
       (30,40,50)]
Code HERE:

>


11) Redo Problem 1 using list comprehension
   hornerC coef x

CODE HERE:

>













