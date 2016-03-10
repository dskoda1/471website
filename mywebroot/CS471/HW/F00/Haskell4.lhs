YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions for 
submitting code.

Purpose:  Continue to program simple recursive functions 
          and to program using list comprehension.

Programming assignment 4.  
Read Chapter 9,10  

   Try:
    ( NOTE: 
        ...> means you can do it at the prompt in HUGS
        > means definitions you must define in a file and read in
    )
   A) What is the principal type of each of the following expressions:
      ...> map map
      ...> map foldl
   B) What does the following definition do?
      > mys = map (2*)
     (try running mys [1,2,3])
   C) What does the following definition do?
      > mys2 = foldr1 (+)
     (try running mys2 [1,2,3])
      > mys3 = foldl1 (+)
      > mys4 = foldl (+) 10
      > mys5 = (map (+1)). (map (*2))
 



1. Write a nonrecursive definition of "length".  
   (Use HOF, fold and or map --do not use sum)
    You may use my function "one" defined below and the compose function, ".".

> lengthHOF  = STUB
> one = (\x -> 1)

CODE HERE:


2. upperStr, covers a string to upper case string.
   Define it using HOF(fold and/or map) and any other needed functions.
   ...> upperStr "abcdEfg"
   "ABCDEFG"
   (232 reductions, 338 cells)

> upperStr = STUB
 


3. sumOfSq, computes the sum of the squares of a list of numbers.  
    Define using hof map, fold and anyother needed functions,
    including . (compose)

    ...> sumOfSq [1,2,3]
    14
    (217 reductions, 352 cells)    
 
> sumOfSq = STUB


4. addEachPair adds together each pair of numbers in a list.
   Write a nonrecursive definition definition (Use HOF and your own "add").
   ...> addEachPairHOF [(1,3),(3,4),(56,33)]
   [4,7,89]
    (40 reductions, 67 cells)

> addEachPairHOF = STUB


5. Redo problem 4 using only primitive recursion.(This should only be 2 lines)
   ...> addEachPairP [(1,3),(3,4),(56,33)]
   [4,7,89]
   (35 reductions, 64 cells)

  
  
> addEachPairP ((a,b):ls) = STUB
> addEachPairP []= []


6. Redo problem 4 using list comprehension.
   ...> addEachPairLC [(1,3),(3,4),(56,33)]
   [4,7,89]
   (36 reductions, 65 cells)


> addEachPairLC ls = STUB

7. Define a factorial using HOF,fold and/or map and any other needed function. 
   ...> factHOF 5
   120
   (137 reductions, 271 cells)
   


> factHOF n = STUB










