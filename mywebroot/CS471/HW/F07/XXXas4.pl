/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */

/* Purpose:
   * to reenforce search order.
   * to reenforce recursive programming
   * to reenforce the use of the list data structure in Prolog
   *   Practice:
       Which of the following queries succeed?  Why?
               (X)=((3))
               (X,Y)=((3,4))
               (X,Y)=((3,4),(a,b)).
               (X) =(1,2,3,4)
              delete([3,3,3],3,S).
              delete([1,3,5],E,S1).
              delete( 3, S2, [1,3,1,3]).
              1+3 ==  2+2
              1+3 =:=  2+2
        How do you think delete is implemented?  Can you explain why
        some queries about "delete" result in "ERROR: Out of global stack"?

	1) For some of the problems below you need only generate a correct
      result from the query without requesting alternative results. 
      You may use cuts but it is not required.
   2) Some problems(++) require the use of append. append will be
	   covered in lecture.  
 */


%1:(From Learn Prolog NOW! exercise 3.2)
%  Define a predicate greater_than/2 that takes two numerals in the
%  notation that w introduced in this lecture (i.e. 0, succ(0),
%  succ(succ(0)) ...) as arguments and decides whether the first one is
%  greater than the second one. E.g:
/*
    ?- greater_than(succ(succ(succ(0))),succ(0)).
    yes
    ?- greater_than(succ(succ(0)),succ(succ(succ(0)))).
    no
  (2 clauses)
*/


%2:  : (From Learn Prolog NOW! exercise 3.3)
% Binary trees are trees where all internal nodes have exactly two
% children. The smallest binary trees consist of only one leaf node. We
% will represent leaf nodes as leaf(Label). For instance, leaf(3) and
% leaf(7) are leaf nodes, and therefore small binary trees. Given two
% binary trees B1 and B2 we can combine them into one binary tree using
% the predicate tree: tree(B1,B2). So, from the leaves leaf(1) and
% leaf(2) we can build the binary tree tree(leaf(1), leaf(2)). And from
% the binary trees tree(leaf(1), leaf(2)) and leaf(4) we can build the
% binary tree tree(tree(leaf(1), leaf(2)), leaf(4)).

% Now, define a predicate swap/2, which produces a mirror image of the
% binary tree that is its first argument. For example:
/****
    ?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)),T).
    T = tree(leaf(4), tree(leaf(2), leaf(1))).
    yes
   (2 clauses)
***/


%3++:  (From Learn Prolog NOW! exercise 6.3) 
%   Write a predicate swapfl(List1,List2) which checks whether List1 is
%   identical to List2, except that the first and last elements are
%   exchanged. Hint: here's where append comes in useful again.
% (1 clauses only)




%4: 
% "Send more money" is a well-known puzzle. Each of the letters
% D,E,M,N,O,R,S and Y represents a different digit. Moreover, when each
% letter is mapped to its corresponding digit the equation SEND + MORE =
% MONEY holds. Below is a very naive . Since there are 8 letters to be
% solved, it simply explore the 10*9*...*3 mappings of letters to
% digits. 
% A little insight can simplify things. Clearly, SEND < 9999 and 
% MORE < 9999. Thus MONEY < 19998 and hence M = 1. 
% Now we have SEND + 1ORE = 1ONEY. Again SEND < 9999 
%  and now 1ORE < 1999 so 1ONEY < 11998. Since M is already bound to 1, 
%  O must be bound to 0. A little more thought shows that S must be
%  bound to 8 or 9, and that N = E + 1. Using these insights to reduce
%  the number of solutions that must be explored, write a Prolog
%  predicate soln([D,E,M,N,O,R,S,Y]) that solves this puzzle by binding
%  the correct digits to each of the variables in the list. (Modified 
%  from http://www.cs.wisc.edu/~fischer/)
% (1 clause with multiple subgoals.)

solvSlow( [D,E,M,N,O,R,S,Y]) :-
	Lst = [S,E,N,D,M,O,R,Y],
	Digits = [0,1,2,3,4,5,6,7,8,9],
	assign_digits(Lst, Digits),
	M > 0, 
	S > 0,
	1000*S + 100*E + 10*N + D +
	1000*M + 100*O + 10*R + E =:=
	10000*M + 1000*O + 100*N + 10*E + Y,
	write(Lst).


assign_digits([], _List).
assign_digits([D|Ds], List):-
        select(D, List, NewList),
        assign_digits(Ds, NewList).

%--------------

/*5: Write a procedure del which removes duplicate elements
     from a list.
      Example:
             ?- del([a,c,x,a,g,c,d,a], A).
             A = [a,c,x,g,d]
             Yes
     (2 clauses)
*/

/*6. Write a procedure 'pick' which returns the first N elements
      of a given list. The given list have at least N elements to
     succeed. Example:
        ?- pick([1,2,4,6,8], 3, L). 
         L=[1,2,4].
    (2 clauses).
*/

/*7: Write a predicate filter/3 such that filter(L1,L2,L3), where L1, L2, and L3 
   are lists, means that L3 consists of those elements of L1 that are not 
   elements of L2, in the same order as they are in L1.
     For example:
     ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X).
     X = [1, 2, 4, 5, 7, 8, 9] 
     Yes
     
    Hint: Use the predefined predicate member/2. Here is the help entry:
    member(Elem, List)
       Succeeds when Elem can be unified with one of the members                                
       of List.
      The predicate can be used with any instantiation pattern.
      It is OK for filter to work only one way, from L1 and L2 to L3.
      By using a cut we can guarentee only correct solutions.  e.g.
        without the cut --
           ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X).
           X = [1, 2, 4, 5, 7, 8, 9] ;
           X = [1, 2, 4, 5, 6, 7, 8, 9] ;
           X = [1, 2, 3, 4, 5, 7, 8, 9] ;
           X = [1, 2, 3, 4, 5, 6, 7, 8, 9] ;
           No
      The same code with a well placed 'cut' will return only the
      correct solution. e.g.  
       ?- filter([1,2,3,4,5,6,7,8,9],[3,6],X). X =
        [1, 2, 4, 5, 7, 8, 9] ; No
      (3 clauses)
*/


  
/* 8: Define a Prolog predicate, skipThird/2 which is true
  when its second argument is a list which is the same as the first argument 
  with every third element removed. You must use the anonymous variable ("_") 
  in place of any variable for which the replacement will not change the meaning 
  of the program. You must ensure that typing semi-colon after 
  getting an answer will not give any bogus answers, and that the program behaves
  reasonably with any of its arguments being variables. (Hint: There are 
  4 clauses.) e.g.
             ?- skipThird([1,2,3,4,5,6,7,8],X).
             X = [1, 2, 4, 5, 7, 8] ;  %NO cut  necessary for this code.
            No
            ?- skipThird([1,2],X).
            X = [1, 2] ;
            No
            ?- skipThird([],X).
             X = [] 
            Yes
     (4 clauses)
*/  




/*9++: Define a procedure unNest, such that unNest(LstOfLsts,UnNestedLst) 
     succeeds if UnNestedLst is a list with only atoms and numbers and
     the numbers and atoms are elements of nested list in LstOfLsts and these
     elements occur in the same in both lists. e.g. 
         ?- unNest([1,[1,3,2,[a,b,c],[a]],[x,y,z]],U).
         U = [1, 1, 3, 2, a, b, c, a, x|...] [write] %(user types "w" here) 
         U = [1, 1, 3, 2, a, b, c, a, x, y, z] 

   (Order of clauses is important. Only 3 clauses necessary. A well
   placed cut will guarentee only correct solutions .)   
*/




/*10: Write a predicate called reduce( Expr, Value) which reduces a numerical 
     Expr to its value.  You should only need is, pattern matching and recursion.  
     The following rule will be the base case.  Since +,* and - have special 
     meaning for the predicate 'is', atoms are used to represent the corresponding
     operator.  Operations are in prefix notation.
                    reduce(N,N):-number(N).
    Here are two test queries: 
    ?- reduce(times(3,plus(5,times(minus( 4,2),3))), Value).
    Value = 33
    Yes
    ?- reduce( times(3, plus(5 , times( minus( 4.5,2), 3))), Value).
    Value = 37.5
    Yes  
   
    (4 clauses).
*/


