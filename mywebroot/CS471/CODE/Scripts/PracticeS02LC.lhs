> module PracticeS02 where
> import List

Practice 1:

Practice 1:
Write a script using function application and recursion 
to find the "running sum" of a list of numbers. 
Find the sum of each list where each successive list 
    has first element is removed from the previous list.
Hint: What is does the built in function sum do?


What is the most general type for your function?


  PracticeS02> rlSum [2,4..10]
  [30,28,24,18,10]
  (232 reductions, 361 cells)


  .. >rlSum2 [2,4..10]
  [30,28,24,18,10]
  (227 reductions, 356 cells)

  PracticeS02> rlSum3 [2,4 .. 10] 
  [30,28,24,18,10]
  (196 reductions, 331 cells)








Practice 2:

Write a script using function application and recursion 
to find the "running sum" of a list of numbers.

Find the sum of each list where each successive list
    has last element is removed from the previous list.



  PracticeS02> lrSum [2,4..10]
  [30,20,12,6,2]
  (242 reductions, 379 cells)




Practice 3:
Write a script that will create a list of lists where each 
list 
  (from the list of lists)
 is constructed by successively by
 removing the last element of the previous list.

Use function application and primitive recursion. (easy)

  PracticeS02> next [2,5 .. 15]
  [[2,5,8,11,14],[2,5,8,11],[2,5,8],[2,5],[2]]
  (293 reductions, 470 cells)

Because of pattern matching -- Order is important





Practice 4:
Write a script that will create a list of lists where each element list 
   (from the list of lists)
 is constructed by successively by
 removing an element of the previous list based on an input function.

Use function application and primitive recursion. (easy)

  PracticeS02> next2 init [2,5 .. 15]
  [[2,5,8,11,14],[2,5,8,11],[2,5,8],[2,5],[2]]
  (293 reductions, 470 cells)
  PracticeS02> next2 tail [2,5 .. 15]
  [[2,5,8,11,14],[5,8,11,14],[8,11,14],[11,14],[14]]
  (283 reductions, 456 cells)





Practice 5:

Using Practice 4 and list comprehension notation and function application 
rewrite running sum.  We will determine  how the elements are removed at
run time. This will be a ONE LINE WONDER!

   PracticeS02> rSumLC [2,5 .. 14] init
   [40,26,15,7,2]
   (249 reductions, 392 cells)





Practice 6:
What is the output of ... 


> startSum (l:ls) = sumLC
>     where
>      sumLC = l:[n+s| (n,s) <- zip ls sumLC]

