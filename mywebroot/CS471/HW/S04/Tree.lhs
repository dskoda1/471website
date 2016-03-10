
        Tree.lhs

	Search trees as an ADT					
                                                                      
        (c) Simon Thompson, 1995, 1998.					
        Modified for CS471, Fall 99
        Chapter 16.7

>       module Tree 
>         (Tree,
>          nil,           -- Tree a
>          isNil,         -- Tree a -> Bool  
>          isNode,        -- Tree a -> Bool
>          leftSub,       -- Tree a -> Tree a 
>          rightSub,      -- Tree a -> Tree a 
>          treeVal,       -- Tree a -> a
>          insTree,       -- Ord a => a -> Tree a -> Tree a 
>          delete,        -- Ord a => a -> Tree a -> Tree a
>          minTree,        -- Ord a => Tree a -> Maybe a
>          prettyPrint    -- Show a => Tree a -> String
>         ) where

Deriving Show allows us to print out the trees.  For example we have
5 trees, t1,t2,t3,t4,and t5, defined later in the code. To print them out 
    Tree> t1


>       data Tree a = Nil | Node a (Tree a) (Tree a)  deriving Show	
 
>       nil :: Tree a

>       nil = Nil

>       isNil :: Tree a -> Bool
>       isNil Nil = True
>       isNil _   = False

>       isNode :: Tree a -> Bool
>       isNode Nil = False 
>       isNode _   = True

>       leftSub, rightSub :: Tree a -> Tree a

>       leftSub Nil            = error "leftSub"
>       leftSub (Node _ t1 _) = t1

>       rightSub Nil            = error "rightSub"
>       rightSub (Node v t1 t2) = t2

>       treeVal  :: Tree a -> a

>       treeVal Nil            = error "treeVal"
>       treeVal (Node v _ _) = v

>       insTree :: Ord a => a -> Tree a -> Tree a

>       insTree val Nil = (Node val Nil Nil)

>       insTree val (Node v t1 t2)
>         | v==val 	= Node v t1 t2
>         | val > v 	= Node v t1 (insTree val t2)	
>         | val < v 	= Node v (insTree val t1) t2	

>       delete :: Ord a => a -> Tree a -> Tree a

>       delete val (Node v t1 t2)
>         | val < v 	= Node v (delete val t1) t2
>         | val > v 	= Node v t1 (delete val t2)
>         | isNil t2 	= t1
>         | isNil t1 	= t2
>         | otherwise 	= join t1 t2


>       minTree :: Ord a => Tree a -> Maybe a

>       minTree t
>         | isNil t 	= Nothing
>         | isNil t1 	= Just v
>         | otherwise 	= minTree t1
>             where
>             t1 = leftSub t
>             v  = treeVal t

------------------------------------------------------------------ 
   printTR : print tree with "(" ")" 
   printTR t5
------------------------------------------------------------------

>       printTR ::(Show a) => Tree a -> String
>       printTR (Node a l r ) = show a ++ " (" ++ printTR l ++ ") " ++ 
>			  " (" ++ printTR r ++ ") "
>       printTR  Nil = []


Pretty Print of a tree (Prints sideways).
   Tree>prettyPrint t1

>       prettyPrint :: Show a => Tree a -> IO ( )
>       prettyPrint t = putStr (printTreeAux  t  0)
>          where
>          printTreeAux Nil n = "" 
>          printTreeAux (Node a lft rt) n = (printTreeAux rt (n+1)) ++
>				     (spaces n) ++ (show a) ++ "\n" ++
>				     (printTreeAux lft (n+1))
>          spaces 0 = ""
>          spaces n = "  " ++ spaces (n-1)



Making the Tree in the type Functor allows me to apply the function "f"
to all node values

For example:
    Tree> fmap (2 +) t1
    Node 8 (Node 3 NillNil) (Node 10 (Node 9 Nil Nil) Nil)

>       instance Functor Tree where
>	      fmap f (Node a l r) = Node (f a) (fmap f l) (fmap f r)
>	      fmap f Nil = Nil 


The join function is an auxiliary, used in delete, where note that it
joins two trees with the property that all elements in the left are
smaller than all in the right; that will be the case for the call in
delete. 

join is not exported.

>       join :: Ord a => Tree a -> Tree a -> Tree a

>       join t1 t2 
>         = Node mini t1 newt
>           where
>           (Just mini) = minTree t2
>           newt        = delete mini t2

Some constant trees for testing purposes.

>       t1 = (Node 7 (Node 2 Nil Nil) (Node 9 (Node 8 Nil Nil) Nil))


>       t2 = (Node 5 (Node 1 Nil Nil) (Node 11 (Node 6 Nil Nil) Nil))

>       t3 = (Node "F" (Node "B" Nil Nil) (Node "M" (Node "J" Nil Nil) Nil))

>       t4 = (Node "H" (Node "E" Nil Nil) (Node "P" (Node "N" Nil Nil)
>			     (Node "R" Nil Nil)))

>       t5 = (Node 'H' (Node 'E' Nil Nil) (Node 'P' (Node 'N' Nil Nil)
>			     (Node 'R' Nil Nil)))



Problem 
Define a function inorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree inorder.

Define a function preorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree preorder.

Define a function postorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree postorder.

Define a function depth :: Tree a -> Int
That returns the depth of the tree.  (Root has depth 0)

Define an higher-order function foldTree :: (a -> a -> a) -> Tree a -> a
You may use any traversal order.

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


Make the Tree type an instance of Functor.


