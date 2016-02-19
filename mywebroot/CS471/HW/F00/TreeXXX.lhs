Fall 2000 - corrected 10.11

        TreeXXX.lhs  --- Rename

	Search trees as an ADT					
                                                                      
        (c) Simon Thompson, 1995, 1998.					
        Modified for CS471, Spring 2000
        Chapter 16.7


> module TreeSol
>     (Tree,
>      nil,           -- Tree a
>      isNil,         -- Tree a -> Bool  
>      treeVal,       -- Tree a -> a
>      insTree,       -- Ord a => a -> Tree a -> Tree a 
>      delete,        -- Ord a => a -> Tree a -> Tree a
>      minTree,       -- Ord a => Tree a -> Maybe a
>      maxTree,       -- Ord a => Tree a -> Maybe a
>      prettyPrint,   -- Show a => Tree a -> String
>      foldTree,      -- Ord a => (a->a->a) -> Tree a -> a 
>      filterTree,    -- Ord a => (a->Bool)-> Tree a -> Tree a  
>      fmap,          -- See the class Functor
>      flatten,       -- Ord a => Tree a -> [a]
>     ) where

  >      successor,    -- Ord a => a -> Tree a -> Maybe a

Deriving Show allows us to print out the trees.  For example we have
5 trees, t1,t2,t3,t4,and t5, defined later in the code. To print them out 
    Tree> t1


> data Tree a = Nil | Node a (Tree a) (Tree a)  deriving Show	

     
> nil :: Tree a

> nil = Nil

> isNil :: Tree a -> Bool
> isNil Nil = True
> isNil _   = False

> isNode :: Tree a -> Bool
> isNode Nil = False 
> isNode _   = True

> leftSub, rightSub :: Tree a -> Tree a

> leftSub Nil            = error "leftSub"
> leftSub (Node _ t1 _) = t1

> rightSub Nil            = error "rightSub"
> rightSub (Node v t1 t2) = t2

> treeVal  :: Tree a -> a

> treeVal Nil            = error "treeVal"
> treeVal (Node v _ _) = v

insTree does not allow duplicates

> insTree :: Ord a => a -> Tree a -> Tree a
> insTree val Nil = (Node val Nil Nil)
> insTree val (Node v t1 t2)
>     | v==val 	= Node v t1 t2
>     | val > v 	= Node v t1 (insTree val t2)	
>     | val < v 	= Node v (insTree val t1) t2	

> delete :: Ord a => a -> Tree a -> Tree a

> delete val (Node v t1 t2)
>     | val < v 	= Node v (delete val t1) t2
>     | val > v 	= Node v t1 (delete val t2)
>     | isNil t2 	= t1
>     | isNil t1 	= t2
>     | otherwise 	= join t1 t2


> minTree :: Ord a => Tree a -> Maybe a

> minTree t
>     | isNil t 	= Nothing
>     | isNil t1 	= Just v
>     | otherwise 	= minTree t1
>     where
>     t1 = leftSub t
>     v  = treeVal t

------------------------------------------------------------------ 
   printTR : print tree with "(" ")" 
   printTR t5
------------------------------------------------------------------

> printTR ::(Show a) => Tree a -> String
> printTR (Node a l r ) = show a ++ " (" ++ printTR l ++ ") " ++ 
>		  " (" ++ printTR r ++ ") "
> printTR  Nil = []


Pretty Print of a tree (Prints sideways).
   Tree>prettyPrint t1

> prettyPrint :: Show a => Tree a -> IO ( )
> prettyPrint t = putStr (printTreeAux  t  0)
>     where
>     printTreeAux Nil n = "" 
>     printTreeAux (Node a lft rt) n = (printTreeAux rt (n+1)) ++
>			       (spaces n) ++ (show a) ++ "\n" ++
>				      (printTreeAux lft (n+1))
>     spaces 0 = ""
>     spaces n = "  " ++ spaces (n-1)




The join function is an auxiliary, used in delete, where note that it
joins two trees with the property that all elements in the left are
smaller than all in the right; that will be the case for the call in
delete. 

join is not exported.

> join :: Ord a => Tree a -> Tree a -> Tree a

> join t1 t2 
>     = Node mini t1 newt
>     where
>     (Just mini) = minTree t2
>     newt        = delete mini t2

Some constant trees for testing purposes.

> t1 = (Node 8.0 (Node 2.0 Nil (Node 7.0 Nil Nil)) (Node 9.0 Nil Nil))

> t2 = (Node 5.0 (Node 1.0 Nil Nil) (Node 11.0 (Node 6.0 Nil Nil) Nil))

> t3 = foldr insTree Nil "ThisIsATestExample"

> t4 = (Node "H" (Node "E" Nil Nil) (Node "P" (Node "N" Nil Nil)
>		 (Node "R" Nil Nil)))

> t5 = (Node 'H' (Node 'E' Nil Nil) (Node 'P' (Node 'N' Nil Nil)
>                 (Node 'R' Nil Nil)))

> t6 = foldr insTree Nil "xyzabc123rstu"

> notBST = (Node 8 (Node 5 (Node 2 Nil Nil) 
>                          (Node 6 (Node 3 Nil Nil) (Node 9 Nil Nil)))
>                  (Node 10 Nil Nil))

> tn1 = (Node 8.0 (Node 5.0 (Node 2.0 Nil Nil) 
>	                (Node 7 (Node 3 Nil Nil) (Node 6 Nil Nil)))
>	        (Node 10 Nil Nil))

> tn2 = (Node 48.0 (Node 39 (Node 36 (Node 32 Nil Nil)(Node 38 Nil Nil)) 
>                        (Node 42 (Node 40 Nil Nil) (Node 45 Nil Nil)))
>	         (Node 60 (Node 50 Nil Nil)(Node 75 Nil Nil)))

> tn3 = (Node 18.0 (Node 9.0 (Node 6.0 (Node 2.0 Nil Nil)(Node 8.0 Nil Nil)) 
>                        (Node 12.0 (Node 10.0 Nil Nil) (Node 15.0 Nil Nil)))
>	         (Node 30.0 (Node 20.0 Nil Nil)(Node 45.0 Nil Nil)))

> tn4 = (Node 48 (Node 39 (Node 36 (Node 32 Nil Nil)(Node 38 Nil Nil)) 
>                        (Node 42 (Node 40 Nil Nil) (Node 45 Nil Nil)))
>	         (Node 60 (Node 50 Nil Nil)(Node 75 Nil Nil)))

------------------------------------------------------------
Problems 

1) Define buildTree using HOF and one of the tree functions defined above

> buildTree :: Ord a=> [a]-> Tree a
> buildTree =  STUB


    -------------------------

2) Define a function maxTree, that returns the maximum value in a bst.


> maxTree :: Ord a => Tree a -> Maybe a
> maxTree t
>     | isNil t 	= Nothing
>     | isNil t1 	= Just v
>     | otherwise 	= maxTree t1
>     where
>     t1 = STUB
>     v  = STUB



++++++++++++++++++++++++++++++++++++++++++++

3) Define an higher-order function foldTree :: (a -> a -> a) -> Tree a -> a
For example:
  Tree> foldTree (+) t1
  26
  Tree> foldTree (+) t2
  23
  Tree>foldTree max t1
  9
  Tree>foldTree max t2
  11
  Tree>foldTree max (join t1 t2)
  11

Note: foldTree is not as general as the standard fold. 

> foldTree :: (a -> a -> a) -> Tree a -> a
> 

4) Making the Tree in the type Functor allows me to apply the function "f"
to all node values

For example:
    Tree> fmap (2 +) t1
    Node 8 (Node 3 Nil Nil) (Node 10 (Node 9 Nil Nil) Nil)

> instance Functor Tree where
>     fmap f (Node a l r) = STUB 
>     fmap f Nil = STUB


5) Define a function flatten that takes a Tree and returns a list of the 
    values stored in the Tree.
  ...> flatten t3
  "AEITaehilmpstx"
  (82 reductions, 176 cells)


> flatten :: Ord a => Tree a -> [a]
> 


            ------------------
6) Define filterTree that removes all nodes that do not satisfy the
       condition "p".  The return value of filterTree should be a BST.
  ...> prettyPrint (filterTree (>'g') t3)
        't'
          's'
      'p'
    'l'
  'h'
      'T'
        'I'
    'E'
      'A'

(863 reductions, 1818 cells)


  TreeSol> prettyPrint (filterTree even tn4)
    60
      50
  48
      42
    40
        38
      36
        32

(571 reductions, 1181 cells)


> filterTree :: Ord a => (a->Bool)-> Tree a -> Tree a



7) CHANGE QUESTION.  I HAVE NOT HAD TIME TO PROGRAM THIS.

Define take n that returns a BST with the first n nodes.  For example if 
the bst contains the following values, {3,5,7,8,17,22,23,34,55,65,75} then 
take 4 returns a bst with the following values, {3,5,7,8}

EXTRA Credit for the first solution shown to me.  Extra credit for the neatest
solution!!










