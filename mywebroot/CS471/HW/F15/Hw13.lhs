> module Hw13.lhs
>  where


Problem 1.
Using an  HOF (map, fold and/or filter )

 1a)  define flattenT that returns a list of value in each tuple.  
    The output should be in the same order as the values appear in the 
     original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



 1b) flattenR is the same as 10a, however, the values appear in the reverse order
   from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]
--------------------
   

Problem 2:  Define 'prodLtoR nums', that given a non empty list of Nums, nums,  
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



Problem 3:  Define 'prodRtoL nums', that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums such that first
      value in the output is the product of all the number nums, the next to
      first value in the output is the product of all the numbers in nums 
      except the first value in nums, etc.  

      *Hw13>  prodRtoLHOF [2,3,4,5]
      [120,60,20,5]



Problem 4:
a) Define a function replicate'' which given a list of numbers returns a 
list with each number duplicated its value.  Use only fold, map and take, (++).


Problem 5: Haskell Hw11 - problem 21 you coded the following problem using 
recursion.
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4

Rewrite the definition using either foldr or foldl. (i.e. figure out what ???
should be)
  sumH = foldr ??? 0
or 
  sumH = foldl ??? 0
  
   ...> sumHarmonic 20
   3.59773965714368
   ...> sumH [1..20]
   3.59773965714368



Problem 6: [20 pts]
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

Now solve the following problems using your knowledge of thue:

  a) Redefine thue using 'map' instead of explicit recursion. My solution 
     was coded using (++), map, lambda expression and mod.  Call this
     function 'thueMap'.
     *.......> thueMap [0,1]
     [0,1,1,0]
  b) Define thueSeq which is a sequence of "thue elements" using the circular
     list illustrated in class for fibseq
      (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
      You must use list comprehension.
 
     *.......> take 4 thueSeq 
      [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1]]
  c) Define thueMapSeq which is a sequence of "thue elements" using a circular
     map definition. It should function the same as thueSeq but uses a map instead.
     *.......> take 4 thueMapSeq 
      [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1]]



Problem 7:
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells)

Problem 8:  (Thompson 17.23 )
Define the list of numbers whose only prime factors are 2, 3, and 5, the
so-called Hamming numbers:


   ...> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]


 You may consider using any combination of the following techniques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions .  You may include your
       merge defined in a previous HW.

(Hint: Apply the circular list idea demonstrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)) 

