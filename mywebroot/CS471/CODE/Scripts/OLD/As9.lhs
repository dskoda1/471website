
YOUR NAME, EMAIL
Don't forget to rename with file as defined in the instructions for 
submitting code.

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming.

          You do not need to use modules on this assignment.

Problem 1:
    Write a Haskell script,  productPair(x,y), which returns the x times  y
      ...> productPair(3,5)
      15
    Code to follow this line.  Remember you must begin the code with ">"


  What is the type (signature) of productPair(x,y)?
  Write answer here.



Problem 2:
    Write a Haskell script, productNum n,  that returns the product of 
        integers from 1 to n. i.e.
        ...> productNum 4
        24
     CODE:


    What does Haskell think the signature of productNum is?  



Problem 3:
    Write a Haskell script, productRange i j , which returns the produce
     of the numbers from i to j.
    ...> productRange 4 6
    120
    CODE:

    What is signature of productRange ?



Problem 4:
    Write a Haskell script zipPair L1 L2, which returns a list of pairs.
    Haskell provides pattern matching and list operators so the lefthand 
    side of function will be
        zipPair (h:t) (n:ns)
    (h:t) h matches the head of the list and t matches the tail --
    like prolog.
    
    ...> zipPair [1,2,3] [a,b,c,d]
    [(1,a), (2,b), (3,c)]
    CODE:


    What is the signature of zipPair?

Problem 5:
   Define a function prodPair L1 L2 which applies zipPair 
         in its definition to return a list of the product pairs.
    ...> prodPair [1,2] [11,12,100]
    [11,24]
    ...> prodPair [1,2,3] [100,99]
    [100, 198]


    What is the signature of prodPair?


Problem 6:
   Using the the data type PairType provided below,  
   write a Haskell script zipPairtype L1 L2, which 
   returns a list of Pairs.

PairType is a user defined type.
Pair is a constructor for the Type, PairType
Later we will discuss deriving keyword.

> data PairType = Pair Int Int deriving Show
>    



   What is the signature?
 







