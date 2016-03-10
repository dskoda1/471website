> module PracticeS02 where
> import List

Practice 1:
Write a script using function application and recursion 
to find the "running sum" of a list of numbers. 
Find the sum of each list where each successive list 
    has first element is removed from the previous list.
(HINT: What does the built in function sum do?)


  PracticeS02> rlSum [2,4..10]
  [30,28,24,18,10]
  (232 reductions, 361 cells)


  .. >rlSum2 [2,4..10]
  [30,28,24,18,10]
  (227 reductions, 356 cells)

  PracticeS02> rlSum3 [2,4 .. 10] 
  [30,28,24,18,10]
  (196 reductions, 331 cells)


Order for this solution is important

> rlSum :: Num a => [a] -> [a]
> rlSum [] = []
> rlSum ns = sum ns : rlSum (tail ns)


> rlSum2 lst@(n:ns) = sum lst : rlSum2 ns
> rlSum2 [] = []

> rlSum3 (h:[]) = h:[]
> rlSum3 (h:hs) = (h + head (rlSum3 hs)):rlSum3 hs


Practice 2:

Write a script using function application and recursion 
to find the "running sum" of a list of numbers.

Find the sum of each list where each successive list
    has last element is removed from the previous list.



  PracticeS02> lrSum [2,4..10]
  [30,20,12,6,2]
  (242 reductions, 379 cells)

  
> lrSum [] = []
> lrSum ns = sum ns : lrSum (init ns)



Practice 3:
Write a script that will create a list of lists where each list 
  (from the list of lists)
 is constructed by successively by
 removing the last element of the previous list.
Use function application and primitive recursion.

  PracticeS02> next [2,5 .. 15]
  [[2,5,8,11,14],[2,5,8,11],[2,5,8],[2,5],[2]]
  (293 reductions, 470 cells)

Because of pattern matching -- Order is important


> next [] = []
> next lst = lst : next (init lst)


Practice 4:
Write a script that will create a list of lists where each list
   (from the list of lists)
 is constructed by successively by
 removing an element of the previous list based on an input function.

Use function application and primitive recursion.

  PracticeS02> next2 init [2,5 .. 15]
  [[2,5,8,11,14],[2,5,8,11],[2,5,8],[2,5],[2]]
  (293 reductions, 470 cells)
  PracticeS02> next2 tail [2,5 .. 15]
  [[2,5,8,11,14],[5,8,11,14],[8,11,14],[11,14],[14]]
  (283 reductions, 456 cells)



> next2 _ [] = []
> next2 rFun lst = lst : next2 rFun (rFun lst)


Practice 5:

Using Practice 4 and list comprehension notation and function application 
rewrite running sum.  We will determine how the elements are removed at
run time. This will be a ONE LINE WONDER!

   PracticeS02> rSumLC [2,5 .. 14] init
   [40,26,15,7,2]
   (249 reductions, 392 cells)

> rSumLC lst rFun = [sum l | l <- next2 rFun lst] 



Practice 6:
Using "circular list" compute the running sum.

PracticeS02> startSum [2,4 ..10]
[2,6,12,20,30]
(175 reductions, 293 cells)

> startSum (l:ls) = sumLC
>     where
>      sumLC = l:[n+s| (n,s) <- zip ls sumLC]

