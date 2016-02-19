Fall 2001

Purpose: Review abstract data types in Haskell, write HOF on 
         a binary search tree data structure.


        TreeXXX.lhs  --- Rename

	Search trees as an ADT					
                                                                      
        (c) Simon Thompson, 1995, 1998.					
        Modified for CS471, Fall 2001
        Chapter 16.7


> module TreeSolF01  --- Rename (filename and module name must be the same)
>     (Tree,
>      nil,           -- Tree a
>      isNil,         -- Tree a -> Bool  
>      isNode,        -- Tree a -> Bool
>      leftSub,       -- Tree a -> Tree a 
>      rightSub,      -- Tree a -> Tree a 
>      treeVal,       -- Tree a -> a
>      insTree,       -- Ord a => a -> Tree a -> Tree a 
>      delete,        -- Ord a => a -> Tree a -> Tree a
>      minTree,       -- Ord a => Tree a -> Maybe a
>      prettyPrint,   -- Show a => Tree a -> String
>      count,         -- Ord a => Tree a -> Float
>      foldTree,      -- Ord a => (a->a->a) -> Tree a -> a
>      fmap           
>      filterTree 
>      tester         -- Int -> Tree a
>     ) where

Deriving Show allows us to print out the trees.  
For example we have 5 trees, 
      t1,t2,t3,t4,and t5, 
defined later in the code. To print them out type at the prompt:
 
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
>     | v==val 	        = Node v t1 t2
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

> t1 = foldr insTree Nil [7.0,2,9,8]

> t2 = (Node 5.0 (Node 1.0 Nil Nil) (Node 11.0 (Node 6.0 Nil Nil) Nil))

> t3 = foldr insTree Nil "ThisIsATestExample"

> t4 = (Node "H" (Node "E" Nil Nil) (Node "P" (Node "N" Nil Nil)
>		 (Node "R" Nil Nil)))

> t5 = (Node 'H' (Node 'E' Nil Nil) (Node 'P' (Node 'N' Nil Nil)
>                 (Node 'R' Nil Nil)))

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

> tn4 = foldr insTree Nil [6.0,4.0,17,35,66,23,12,1,2,7]

> tn5 = (Node 48 (Node 39 (Node 36 (Node 32 Nil Nil)(Node 38 Nil Nil)) 
>                        (Node 42 (Node 40 Nil Nil) (Node 45 Nil Nil)))
>	         (Node 60 (Node 50 Nil Nil)(Node 75 Nil Nil)))

'tester' and 'testerF' allow for easy export of trees for use with 
  code in other files.  
'tester' provides Int trees and testerF provides Double trees

> tester 1 = t1
> tester 2 = t2
> tester 3 = tn1
> tester 4 = tn2
> tester 5 = join tn1 tn2
> tester 6 = tn3
> tester 7 = tn4
> tester x = error "Enter 1 to 7"

> depth :: Tree a -> Int
> depth Nil  =0
> depth (Node n t1 t2) = 1 + max (depth t1) (depth t2)


Problems 
1) Define a function inorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree inorder.

2) Define a function preorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree preorder.

3) Define a function postorder :: Ord a => Tree a -> [a] 
Create a list of the items as you traverse the tree postorder.

> inorder :: Ord a => Tree a -> [a]
> inorder Nil = []
> inorder (Node v l r) = inorder l ++ [v]++ inorder r

> preorder :: Ord a => Tree a -> [a]
> preorder Nil = []
> preorder (Node v l r) = [v] ++ preorder l ++ preorder r
>		  
> postorder :: Ord a => Tree a -> [a]
> postorder Nil = []
> postorder (Node v l r) = postorder l ++ postorder r ++ [v]



4) Define a function count :: Tree a -> Double
count is the number of Nodes in the tree

> count :: Tree a -> Double
> count Nil = 0
> count (Node v l r) = 1 + count l + count r



5) Define an higher-order function foldTree :: (a -> a -> a) -> Tree a -> a
For example:
  Tree> foldTree (-) t1
  4.0
  Tree> foldTree (*) t2
  330.0
  Tree>foldTree max t1
  9.0
  Tree>foldTree max t2
  11.0
  Tree>foldTree max (join t1 t2)
  11.0

There are a number of different possible implementations.

> foldTree :: (a -> a -> a) -> Tree a -> a
> foldTree f (Node v Nil Nil) = v
> foldTree f (Node v Nil r) = f v (foldTree f r)
> foldTree f (Node v l Nil ) = f v (foldTree f l)        
> foldTree f (Node v l r) = f (f v (foldTree f l)) (foldTree f r)

> foldTree2 :: (a -> a -> a) -> Tree a -> a
> foldTree2 f (Node a Nil Nil) = a
> foldTree2 f (Node a t1 Nil) = f a  (foldTree2 f  t1)
> foldTree2 f (Node a Nil t2) = f a  (foldTree2 f  t2)
> foldTree2 f (Node a t1 t2) =(f a  (f  (foldTree2 f  t1)(foldTree2 f  t2)))

> foldTreeH ::  Ord a => ( Tree a -> [a]) -> (a -> a -> a) -> Tree a -> a
> foldTreeH order f tree = foldl1 f (order tree)

> foldTreeH2 ::  Ord a => ( Tree a -> [a]) -> (a -> a -> a) -> Tree a -> a
> foldTreeH2 order f tree = foldr1 f (order tree)

> foldTreeX :: Ord a => ((a->a->a)->[a]->a)->
>                       ( Tree a -> [a]) -> (a -> a -> a) -> Tree a -> a
> foldTreeX foldFun order f tree = foldFun f (order tree)


6) Make the Tree in the type Functor allows me to apply the function "f"
to all node values

For example:
    Tree> fmap (2 +) t1
    Node 10.0 (Node 4.0 Nil (Node 9.0 Nil Nil))(Node 11.0 Nil Nil)



> instance Functor Tree where
>     fmap f (Node a l r) = Node (f a) (fmap f l) (fmap f r)
>     fmap f Nil = Nil 


6) Define filterTree that removes all nodes that do not satisfy the
    condition "p".  The return value of filterTree should be a BST.
  ...> prettyPrint (filterTree (>'g') t3)
      'x'
        't'
          's'
     'p'
       'm'
    'l'
       'i'
  'h'
 

(1172 reductions, 2304 cells)


  TreeSol> prettyPrint (filterTree even tn5)
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
> filterTree f (Node v lt rt) 
>     | isNil lt && isNil rt && (f v) = Node v Nil Nil
>     | isNil lt && isNil rt && (not.f) v= Nil 
>     | isNil lt && f v = (Node v Nil (filterTree f rt))
>     | isNil lt && (not.f) v = filterTree f rt
>     | isNil rt && f v =  (Node v  (filterTree f lt) Nil )
>     | isNil rt && (not.f) v  = filterTree f lt
>     | f v = (Node v (filterTree f lt) (filterTree f rt))
>     | (not.f) v = if isNil(filterTree f lt) then (filterTree f rt)
>	               else if isNil(filterTree f rt) then (filterTree f lt) 
>                              else join (filterTree f lt) (filterTree f rt)



> filterTree2 :: Ord a => (a->Bool)-> Tree a -> Tree a
> filterTree2 f t@(Node v lt rt)
>      | f v = (Node v (filterTree2 f lt) (filterTree2 f rt)) 
>      | (not.f) v = filterTree2 f (delete v t) 
> filterTree2 f Nil = Nil














