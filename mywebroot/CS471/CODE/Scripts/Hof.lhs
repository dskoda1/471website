CS471  
Apr 29, 2001

Hof.lhs -- 

Summary of theorems for HOF

Properties of general functions that can be proved:
   map ( f. g ) xs = (map f . map g) xs
   (filter p . map f) xs = (map f . filter (p . f)) xs
   map f ( reverse xs) = reverse (map f xs )
   map f ( ys ++ zs )  = map f ys ++ map f zs

See Thompson Section 10.9
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Type Checking Thompson Chapter 13

What is the type of?

> h = g . f



Given f and g:

> f (x,y) = (x, ['a' .. y])
> g (m,zs)= m + length zs

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Examples with multiple solutions techniques, 
         primitive recursion, 
         list comprehension
         higher order functions, including function composition

Problem: Remove elements

Using list comprehension:

> removeLC r lst = [ l | l <- lst, l /= r]
>	   

Using recursion:

> removeR r (l:ls) 
>  | r == l = removeR r ls
>  | otherwise = l:removeR r ls
> removeR r [] = []

Using HOF:

> removeHOF r lst = filter removef lst 
>     where
>     removef = (r /=) 

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Problem: Remove letter, r,  and capitalize all the rest.  
         Assumes all input is lower case letters.

> removeCap r (c:cs) 
>  | r == c = removeCap r cs
>  | otherwise = (toUpper c):removeCap r cs
> removeCap r [] = []

> removeCapP r str = 
>     if str == [] then []
>     else if head str == r then  removeCapP r (tail str)
>     else toUpper (head str):removeCapP r (tail str)

> removeCapLC r cs = [toUpper c | c <- cs, c /=r ]

> removeCapHOFV r cst = (filter removef . map toUpper) cst 
>     where
>     upperR = toUpper r
>     removef = (upperR /=) 

> removeCapHOF r  = (filter ((toUpper r) /=) . (map toUpper)) 
> removeCapHOF1 r cst  = (filter ((toUpper r) /=) . (map toUpper)) cst

> removeCapHOF2 r  = ((map toUpper) . (filter ((toUpper r /=) . toUpper))) 

> removeCapHOFX r = (map toUpper . filter (r /= )) 


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Problem add 1 to all non-negative number and remove negative numbers 
from the list.  Example from page 197
Illustrates (filter promotion)
       (filter p . map f) xs = (map f . filter (p . f)) xs

> addRemoveR nst =
>     if nst == [] then []
>     else if (<0) (head nst) then addRemoveR (tail nst)
>     else (+1) (head nst) :addRemoveR (tail nst)

> addRemoveHOF ns = (map (+1) . filter ((0<).(+1))) ns

> addRemoveHOFS ns = (filter (0<) . map (+1)) ns

> addRemoveLC nst = [(+1) n| n <- nst, (0<=) n ]


+++++++++++++++++++++++++++++++++++++++++++++++
Illustrates-- flips, maps, function composition and filter promotion 
Input: list of integers
Output: list of integers that are the original number divided by 2 
        (NOTE: this is integer division) and the result is even.


> divRemHOF ns = ((map (flip (div) 2)) . (filter (even . (flip (div) 2)))) ns

> divRemHOF2 ns = ((filter even) . (map (flip (div) 2))) ns

> divRemLC ns = [ div n 2 | n <- ns, even(div n 2)]



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Problem: for each element in a list, add 15 and double the result
       Illustrates:   map ( f. g ) xs = (map f . map g) xs

> arithLC nst = [2*(n +15)| n<- nst]

> arithR (n:ns) = (2*(n+15)):arithR ns
> arithR [] =  []

> arithHOF nst = (map (2 *) . map (15 +)) nst

> arithHOF2 nst = map ((2 *) . (15 +)) nst


Problem: apply f to each element in the list then apply g

> arithGenLC f g nst = [g (f n)| n<- nst]

> arithGenLC2 f g nst = [ (g . f) n | n<- nst]

> arithGenR f g (n:ns) = g (f n):arithGenR f g  ns
> arithGenR _ _ [] =  []

> arithGenR2 f g (n:ns) = (g . f) n:arithGenR2 f g ns
> arithGenR2 _ _ [] =  []

> arithGenHOF f g nst = (map g . map f) nst

> arithGenHOF2 f g nst = map (g . f) nst

++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Misc. examples

Problem add an element to the head of every list in a list.
  Main> addH 3 [[2,45], [4599,3,4],[]]
  [[3,2,45],[3,4599,3,4],[3]]
  (47 reductions, 113 cells)

> addH elem   = map ((:) elem) 


Problem add a list to every element is a list.
    Main> addList [1,23] [1,2,3,4]
    [[1,1,23],[2,1,23],[3,1,23],[4,1,23]]
    (62 reductions, 156 cells)

> addList lst = map (flip (:) lst)

Using lambda expression and HOF for average 

> aver = (\x ->(div) (foldr1(+) x) (length x))


> aver2 x = (div)(foldr1(+) x) (length x)



Define reverseHOF using HOF (one line of code)
What is the type of reverse?
Which HOF do we use?


> reverseHOF1 xs = foldl revOp [] xs
>	   where 
>             revOp acc x = x:acc

> reverseHOF = foldl (flip (:)) []

> reverseHOF2  = foldl ((\x y z -> x z y) (:)) []







