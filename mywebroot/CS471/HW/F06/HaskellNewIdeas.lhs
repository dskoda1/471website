Write a Haskell script to calculate the n-th tetrahedral number. The n-th tetrahedral number is the sum of the numbers:

        1
        1 2
        1 2 3
        1 2 3 4

         .....

        1 2 3 4  .... n

The first few tetrahedral numbers are:

        1, 4, 10, 20, 35


> sigma n m
>   | n > m      = 0
>   | otherwise  = n + sigma (n + 1) m

> tetrahedral n
>    | n == 1    = 1
>    | n > 1     = (sigma 1 n) + (tetrahedral (n - 1))
>    | otherwise  = error "tetrahedral: illegal argument"


Write a Haskell function sigma that given two inputs n and m computes the sum of the integer values from n and m.



Assume that the values n and m are in variable of the same name declared elsewhere. 

> sigma2 n m = sum [n..m]

http://www.haskell.org/hawiki/ContinuationPassingStyle
