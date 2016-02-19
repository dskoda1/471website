April 8, 2000 
    As11.lhs  --- rename according to your filename
     Don't forget to rename file as defined in the instructions for 
     submitting code.
YOUR NAME, EMAIL


Purpose:  Reenforce your understanding of recursion, list comprehension 
          and higher order functions (HOF).  

> module As11  -- rename (Filename and module name must be the same)
>     where
> import TreeXXX -- need to rename according to your filename


--------------------------------------------------------------------
USE PRIMATIVE RECURSION ONLY
1 ) A version of quicksort2 that uses a local function of 
    partitions which only traverse the list once.
    partition :: Ord -> [Ord] -> ( [Ord], [Ord] )
CODE:

> quicksort lst = []  -- STUB
>	  where
>         partition p lst = [] -- STUB


2)Using only primitive recursion, average1 write a script 
    that takes the average of list of Double.
CODE:



----------------------------------------------------------------------
LIST COMPREHENSION
3.Write a script called, average2, employing list comprehension.  
 Create running average list of Double.
      ...>average2 [2,4,3,15] 
      [2,3,3,6]
CODE:



------------------------------------------------------------------------
HOF
4.Use the HOF, map, to square the values of a list. 
       ...> sqLst [1,2,3] 
            [1,2,9] 
CODE:


5. lengthBefore counts the number of elements until the predicate 
   function becomes true.  You must use HOF.
   ...> lengthBefore (a==) "123a"
   3
   ...> lengthBefore (/=5) [5,5,5,5,7,4,2,3]
   4


CODE:

  

6.Using HOF, write a script, average3, that returns the average of a 
  list of doubles. 



Complete the rest of assignment, 
which is in TreeXXX.lhs.
TreeXXX is ADT that exports many functions for you to use.  

7.  Using HOF provided in your module Tree, write a script which 
     calculates the average of the values in a given tree.  Remember trees 
     only be constructed in the module Tree.  I have provide a few for you
     to use in your testing.
     
    ...> treeAverage (tester 3)
    5.85714

CODE:









