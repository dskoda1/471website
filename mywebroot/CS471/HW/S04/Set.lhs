
2) Write a module Set.     
   Implement set as an unordered list.  You should have the following methods:


Make Set an instance of EQ.
Make Set an instance of Functor

> module Set 
>     (Set,
>      empty              , -- Set a  -
>      addElement         , -- Set a -> a -> Set
>      memSet              -- Ord a => Set a -> a -> Bool                
>     --  makeSet            , -- Ord a => [a] -> Set a
>    --  subSet             , -- Ord a => Set a -> Set a -> Bool
>    --  card                 -- Set a -> Int
>     ) where

                       

> data  Set a = SetI [a] deriving Show
  
> empty  = SetI []
> memSet (SetI (h:t)) e = (e==h) || memSet (SetI t) e
> memSet (SetI []) e = False

Example code
Set> addElement (addElement empty 3) 5
SetI [5,3]
(78 reductions, 205 cells)
Set> addElement (addElement (addElement (addElement empty 3) 5) 3 )2
SetI [2,5,3]
(99 reductions, 176 cells)

> oneSet =  
>     addElement (addElement (addElement (addElement empty 'w') 'r') 'e' )'a'

> addElement (SetI l) e = 
>     if (memSet (SetI l) e) 
>          then (SetI l) 
>	   else (SetI (e:l))