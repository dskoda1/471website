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
              select(3,[3,3,3],S).
              select(E,[1,3,5],S1).
              select( 3, S2, [1,3,1,3]).
              1+3 ==  2+2
              1+3 =:=  2+2
       
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
*/


%2:  : (From Learn Prolog NOW! exercise 3.3)
% Binary trees are trees where all internal nodes have exactly two
% childres. The smallest binary trees consist of only one leaf node. We
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
***/



%3:  (From Learn Prolog NOW! exercise 6.3) 
%   Write a predicate swapfl(List1,List2) which checks whether List1 is
%   identical to List2, except that the first and last elements are
%   exchanged. Hint: here's where append comes in useful again.



%4: 
% "Send more money" is a well-known puzzle. Each of the letters
% D,E,M,N,O,R,S and Y represents a different digit. Moreover, when each
% letter is mapped to its corresponding digit the equation SEND + MORE =
% MONEY holds. solvSlow, is a very naive solution. Since there are 8 letters 
% to be solved, it simply explore the 10*9*...*3 mappings of letters to
% digits. 
% A little insight can speed the search. Clearly, SEND < 9999 and 
% MORE < 9999. Thus MONEY < 19998 and hence M = 1. 
% Now we have SEND + 1ORE = 1ONEY. Again SEND < 9999 
%  and now 1ORE < 1999 so 1ONEY < 11998. Since M is already bound to 1, 
%  O must be bound to 0. A little more thought shows that S must be
%  bound to 8 or 9, and that N = E + 1. Using these insights to reduce
%  the number of solutions that must be explored, write a Prolog
%  predicate soln([D,E,M,N,O,R,S,Y]) that solves this puzzle by binding
%  the correct digits to each of the variables in the list. (Modified 
%  from http://www.cs.wisc.edu/~fischer/)

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



/*5: Recall that in languages like Prolog, sets can be represented as lists.
     However, unlike lists, the order of values in a set is not significant. 
     Thus both [1,2,3] and [3,2,1] represent the same set.

    Write facts and rules that define a Prolog relation setEq(S1,S2) that tests
    whether sets S1 and S2 (represented as lists) are equal. Two sets are equal 
    if they contain exactly the same members, ignoring ordering. In this part 
    you may assume that sets contain only atomic values (numbers, and symbols). 
    You may also assume that S1 and S2 are ground (that is, they are constants 
    or are bound to fixed values). For example

      ?- setEq([1,2,3], [3,2,1]). 
      yes
      ?- setEq([1,2], [3,2,1]). 
      no
      ?- setEq([susan, john, lyta], [lyta, john, susan]). 
      yes
 
 Modified from http://www.cs.wisc.edu/~fischer/     
*/



/*6: Define a procedure countLsts, such that countLst(+LstOfLsts,?Count) 
      calculates the number of total number of lists in LstOfLsts e.g.
      ?- countLsts([[a,[b,c,[a,x,t]],[1,[],[2,3]]],[x,[y],a]],C). 
      C = 9 
      Yes 
      ?- countLsts([[a,[b,c,[a,x,t]],[a,b,c,1,2,3]],[x,y,a]],C). 
      C = 6
      Yes
*/



/*7: Write a predicate called reduce( Expr, Value) which reduces a numerical 
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
*/



%8. Design and test 'memberSeq(E,Seq)' that succeeds if E is an element 
%   of the sequence, Seq.
%     e.g.
%        ?- memberSeq(a,(1,2,3,a,4,5)).
%        Yes
%        ?-  memberSeq(a,X).
%        X = a;
%        X = a, _G198 ;
%        X = _G197, a ;
%        X = _G197, a, _G201 
%        Yes
%        ?-memberSeq(a,(a)).
%        Yes



% 9:  Design and test , 'seqAppend(SeqA, SeqB, Seq)' which is intended to  
%     produce a sequence Seq.  Seq has all the elements of SeqA followed by 
%     all the elements of SeqB.  Remember that
%     the smallest sequence has ONE element.
%      e.g.
%           ?- seqAppend((1,4,7,5),(a,z,w),A).
%           A = 1, 4, 7, 5, a, z, w 
%           Yes
%           ?-  seqAppend(A,B,(1,4,7,5,a,z,w)).
%           A = 1, 4, 7, 5, a, z
%           B = w ;
%           A = 1, 4, 7, 5, a
%           B = z, w ;
%        ...


%10:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %    powerset(+Set,-PowerSet).
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Define a procedure powerset(+Set,-PowerSet),given a Set, represented by 
% a list, it creates the powerset of Set. e.g. 

/****
  ?- powerset([],X).
  X = [[]]
  ?- powerset([1],X).
  X = [[],[1]]  % order of sets not important
  ?- powerset([a,b],P).
  P = [[a,b], [a], [b], []]      
  %%% order of sets not important?- powerset(S,[[a],[b],[a,b],[]]).
  %%%  May run out of stack ... YOUr code does not need
  %%%  to work for this query.
  ?- powerset([a,b],[[a],[b],[a,b],[]]).
  %%%  may run out of stack ... YOUr code does not need
  %%%  to work for this query.
****/


/* 11: First given on assignment 2.
       Write a procedure that implements the  Ackermann's functions as 
       defined in Homework assignment 1. What is the "ackermann number" for
       your version of prolog? 
  */

