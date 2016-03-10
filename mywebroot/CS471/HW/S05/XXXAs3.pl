/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

% 1. double(Lst,DoubleLst)
/* Given a Lst, DoubleLst is a list with each element of Lst repeated once.
   i.e.
   18 ?- double([1,2,3,9,78,100],X).
   X = [1, 1, 2, 2, 3, 3, 9, 9, 78|...] [write]
   X = [1, 1, 2, 2, 3, 3, 9, 9, 78, 78, 100, 100] 
   yes
*/





% 2. palindrome(P).
/* Solve LearnPrologNow exercise 6.2 using recursion and the built-in
   prediate "append".
*/





%   Use the built-in predicate: append as part of your solutions 
%   for problems 3 - 7. We will cover append in class.
%3 concatenate(+ListOfLists,-Flat) 
/*
   Given a ListOfLists of lists of single terms, 
           Flat is a list of single terms extracted out of each of the lists.
   ?- concatenate([[1],[a,b,c],[100,91]],C).
   C = [1, a, b, c, 100, 91]
   Yes
   ?- concatenate([[1],[a,b,c],[],[100,91]],C).
   C = [1, a, b, c, 100, 91]
   Yes
   ?- concatenate([[1],[a,[b],c],[],[100,91]],C).
   C = [1, a, [b], c, 100, 91]
   Yes
   ?- concatenate(C,[100, 91, a, b, c, 1]).
   C = [[100, 91, a, b, c, 1]] ;
   C = [[100, 91, a, b, c, 1], []]
   Yes

*/




%4 concatenateReverse(+ListOfLists, FlatReverse).
/*  
 Given a ListOfLists of lists of single terms, 
           Concat is a list of single terms extracted out of each of the lists 
                  but is in reverse order.(Reverse of the result of problem 3).
 DO NOT USE THE BUILTIN PREDICATE reverse.
    i.e.
    ?- concatenateReverse([[1],[a,b,c],[100,91]],C).
    C = [100, 91, a, b, c, 1]
    Yes
    ?- concatenateReverse([[1],[a,[b],c],[100,91]],C).
    C = [100, 91, a, [b], c, 1]
    Yes
    ?- concatenateReverse([[1],[a,b,c],[],[100,91]],C).
    C = [100, 91, a, b, c, 1]
    Yes
    ?- concatenateReverse(C,[100, 91, a, b, c, 1]).
    C = [[100, 91, a, b, c, 1]] ;
    C = [[100, 91, a, b, c, 1], []] ;
    C = [[100, 91, a, b, c, 1], [], []]
    Yes
 
    Hint order of subgoals is important.
*/




%5. concatenateSub1(+ListOfLists,-SubListOfLists).
/*
   Given a ListOfLists of lists of single terms, 
         SubListOfLists is a list of lists which each element is
            is a flat list. Each flat list is an accumulation of the elements 
            from the ListOfLists. The first list has all the lists appended 
            together, the second element has all the terms except the ones in 
            the first list of the ListOfLists, etc.
         
   For example:
   ?- concatenateSub1([[1],[a,b,c],[100,9]],C).
   C = [[1, a, b, c, 100, 9], [a, b, c, 100, 9], [100, 9]]
   Yes
   ?- concatenateSub1([[1],[a,b,c],[],[100,9]],C).
   C = [[1, a, b, c, 100, 9], [a, b, c, 100, 9], [100, 9], [100, 9]]
   Yes
   ?- concatenateSub1([],C).
   No
   ?- concatenateSub1([[]],C).
   C = [[]]
   Yes
   ?- concatenateSub1([[1,2],[a,[b,c]],[100,9]],C).
   C = [[1, 2, a, [b, c], 100, 9], [a, [b, c], 100, 9], [100, 9]]
   Yes

*/ 




%6. concatenateSub2(+ListOfLists,-SubListOfLists)
/* (DO NOT USE the builtin "reverse" in you solution.) 
   Is simular to problem 5, except the first list in SubListOfLists is only
   terms from the first list in the ListOfLists, the second list in 
   SubListOfLists  has is the first list appended to the second list 
   (from the ListOfLists). etc
  
   (Note: to get all the lists printed out type "w". i.e 
    to get   
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
    instead of 
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]]
    type "w" right after
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]] w
    appears as a result of your query.
    You will see: 
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c|...]] [write]
     C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
   )

  ?- concatenateSub2([[1],[a,b,c],[100,9]],C).
  C = [[1], [a, b, c, 1], [100, 9, a, b, c, 1]]
  Yes
  ?- concatenateSub2([[1],[a,b,c],[],[100,9]],C).
  C = [[1], [a, b, c, 1], [a, b, c, 1], [100, 9, a, b, c, 1]]
  Yes
  ?- concatenateSub2(L,[[1], [a, b, c, 1], [100, 9, a, b, c, 1]]).
  L = [[1], [a, b, c], [100, 9]]
  Yes
  ?- concatenateSub2([[]],C).
  C = [[]]
  Yes
  ?- concatenateSub2([],C).
  No
  ?- concatenateSub2([[1,2],[a,[b,c]],[100,9]],C).
  C = [[1, 2], [a, [b, c], 1, 2], [100, 9, a, [b, c], 1, 2]]
  Yes

*/



%7.  puzzle(R1,R2,R3,R4) 
/*
  Write a prolog program to solve the puzzle in the written part #3.  
  Apply the ideas use to solve LearnPrologNOW ex.2.4.
  This problem can be coded with 10 facts and 1 rule.  
  The rule has many subgoals. There will be no explicit recursions!  
  Prolog's backtracking will be used to solve the problem. First think
  what NOT how.  If you are sure that the logic is correct and your answer
  is taking too long ...  You may need to reorder you subgoals.
*/


%8 remove(E,Lst1,Lst2).
/* remove(E,Lst1,Lst2) succeeds if Lst2 is the same as Lst1 except that the term E is removed.
   Do not use any built-in predicates. 
  3 ?- remove(3,[1,2,3,4,5],X).
  X = [1, 2, 4, 5] ;
  No
  4 ?- remove(3,[1,2,3,4,5,3,3],X).
  X = [1, 2, 4, 5, 3, 3] ;
  X = [1, 2, 3, 4, 5, 3] 
  Yes
  5 ?- remove(3,X,[1,2,3,4,5,3,3]).
  X = [3, 1, 2, 3, 4, 5, 3, 3] ;
  X = [1, 3, 2, 3, 4, 5, 3, 3] ;
  X = [1, 2, 3, 3, 4, 5, 3, 3] 
 */



%9 LearnPrologNOW 11.4 Practical Session 11 ex 1
/*  1. Sets can be thought of as lists that doesn't contain any 
       repeated elements. For example,[a,4,6] is a set, but [a,4,6,a] is not 
       (as it contains two occurrences of a). Write a Prolog program 
        subsetg/2 that is satisfied when
        the first argument is a subset of the second argument (that is, 
        when every element of the first argument is a member of the 
        second argument). For example:
    subsetg([a,b],[a,b,c])
    yes
    subsetg([c,b],[a,b,c])
    yes
    subsetg([],[a,b,c])
    yes.
       Your program should be capable of generating all subsets of an input 
       set by bactracking. For example, if you give it as input
    subsetG(X,[1,2,3])
       it should successively generate all eight subsets of [1,2,3] 
      in any order.i.e.

     9 ?- subsetg(Sub,[1,2,3]).
     Sub = [] ;
     Sub = [1] ;
     Sub = [1, 2] ;
     Sub = [1, 2, 3] ;
     Sub = [1, 3] ;
     Sub = [1, 3, 2] ;
     Sub = [2] ;
     Sub = [2, 1] ;
     Sub = [2, 1, 3] ;
     Sub = [2, 3] ;
     Sub = [2, 3, 1] ;
     Sub = [3] ;
     Sub = [3, 1] ;
     Sub = [3, 1, 2] ;
     Sub = [3, 2] ;
     Sub = [3, 2, 1] ;
     No
    (NOTE: You should call the predicate "subsetg" instead of subset.
           Consider using the predicate defined in problem 8.
           Also this is NOT subList.)
*/






% 10. Code newtonSqrt/3 
/*  using the algorithm in written part 4. You will need to
    supply a "closeness" value to stop the calculation.  You should use a
    write/1 to printout the values as your approximation converges.
    For example:
    13 ?- newtonSqrt(2,1,0.0005,Sqrt).
    1.5
    1.41667
    1.41422
    Sqrt = 1.41422 
    Yes

    14 ?- newtonSqrt(2,1,0.05,Sqrt).
    1.5
    1.41667
    Sqrt = 1.41667 
    Yes
*/



%11. executeList(EList) 
/*   Given a list of predicates, executeList(Elist) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own.

   i.e.
    ?- executeList([=(A,99),is(B,+(5,94)),C=abc,C @< abcd,A=B]).
    A = 99 
    B = 99
    C = abc
    Yes
    ?- executeList([=(A,99),is(B,+(5,95)),C=abc,C @< abcd,A=B]).
    No
    ?- executeList([=(A,99),is(B,+(5,95)),write(B),C=abc,C @< abcd,A=B]).
   100
   No

*/


 


% 12.(easy- ONE relation--  Need to understand difference lists before attempting this problem.)
%   Define a predicate   append3DL  that concatenates three difference lists:
%  ?- append3DL( [z,y|A] - A, [x,w | B] -B, [u,v | C] - C, What).
%  What = [z, y, x, w, u, v | _n] - _n
%  yes



%13. flat(+LstOfLst,-FLst).
/*
   We 'flat'ten a list by removing all the square brackets around any lists 
   it contains as elements, and around any lists that its elements contain 
   as element, and so on for all nested lists. For example, when we flatten 
   the list
   [a,b,[c,d],[[1,2]],foo]
       we get the list
   [a,b,c,d,1,2,foo]
       and when we flatten the list
   [a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]]
       we also get
   [a,b,c,d,1,2,foo].
   Write a predicate flat(List,FlatLst) that holds when the first argument List
   flattens to the second argument FlatLst. Challenge: 
   This exercise can be done without making use of the built-in append/3.

*/ 











