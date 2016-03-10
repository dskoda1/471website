Problem 3: 
Using the idea of the induction proof for problem 12 assignment 1
   (http://bingweb.binghamton.edu/~head/CS471/HW/hw1f00.html#Powerset)
create the power set of a set.  Where sets are represented as lists.
It might be easier if you define a local function addElementToSets.

  ...> powerSet [1,2,3] 
  [[1,2,3],[2,3],[1,3],[3],[1,2],[2],[1],[]]
  (67 reductions, 205 cells)


> powerSet3 [] = [[]]
> powerSet3 (e:es) = addToSets e (powerSet3 es) ++ (powerSet3 es)
>	    where
>           addToSets e (s:ss) = (e:s):(addToSets e ss)
>           addToSets e [] = []

> powerSet2 []=[[]]
> powerSet2 (e:es) = addToSets e set ++ set
>     where
>     set = powerSet2 es
>     addToSets e (s:ss) = (e:s):(addToSets e ss)
>     addToSets e [] = []


> powerSet [] = [ [] ]
> powerSet (e:t) = addToSets e (powerSet t) 
>     where
>     addToSets e (h:t)= (e:h):h:addToSets e t
>     addToSets e [] = []



Problem 4:  Use List comprehension to replace addElementsToSets.
  ...> powersetLC [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (106 reductions, 283 cells)

CODE HERE:

> powerSetA []    = [[]]
> powerSetA (x:xs) = [(x:p)|p<-psxs] ++ psxs
>     where
>     psxs = powerSetA xs   

> powersetC [] = [[]]
> powersetC (hp:tp) = [hp:t|t<-(powersetC tp )]
>	              ++ powersetC tp   






Problem 4:  Use List comprehension to replace addElementsToSets.
  ...> powersetLC [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (106 reductions, 283 cells)

CODE HERE:

> powerSetLC []    = [[]]
> powerSetLC (x:xs) = STUB....


Problem 7:
Define a function repeatN, only using list comprehension notation that takes an
(Num a, Enum a) and returns a list with numbers 1 to n 
where 1 occurs once, 2 occurs twice .... and n occurs n times. 
(This is a one line wonder) i.e.

    ...> rep 0
    []
    (28 reductions, 46 cells)
    ...> rep 3
    [1,2,2,3,3,3]
    (265 reductions, 455 cells)
    ...> rep 6
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6]
    (691 reductions, 1178 cells)



> rep :: (Num a, Enum a) => a -> [a]
> rep n = [ r | r <- [1 .. n], occurs <- [1 .. r]] 
