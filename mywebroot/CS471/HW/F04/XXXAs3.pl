% Examples corrected 9/17
/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

% 1.  Write a predicate 
%       bagToSet(+Bag,-Set).
%  that converts a Bag to a Set. 
% Note the elements can be in any order in the lists.
%
%      ?- bagToSet([1,2,3,6,6,1,2,3,a,3,3,6,11,1],S). 
%      S = [2, a, 3, 6, 11, 1]
%      yes
%      ?- bagToSet([an,net,and,an,the,any,an],S).
%      S = [net, and, the, any, an] 
%      Yes 
% 





% 2. Define a predicate, prod(+Lst, Prod). Where Prod is the product of 
%    the numbers in Lst. You may assume that Lst is a non empty list of numbers.
%     ?- prod([2,3,2],P).
%     P = 12
%     Yes



% 3. prodRtoL(+L,?S).
/* Given a non empty list of numbers, L, 
   S is a list of the prod of the numbers in L such
   that first number in S is the prod of all the number L, the second number 
   in S the prod of all the numbers in L except the first number in L, etc.
   For example:
    ?- prodRtoL([1,2,3,4],P).
    P = [24, 24, 12, 4]
    Yes

*/ 




% 4. prodLtoR(L,S).  
/* Is simular to prodRtoL(+L,?S), except that prod totals 
   accumulate left to right.
      ?- prodLtoR([1,2,3,4],P).
      P = [1, 2, 6, 24]
      Yes
*/





/* 5: Given a list of predicates, applylist(L) succeeds only if
      each of the predicates in the list succeeds. Note: the scope
      of variables names is the entire list. You can apply each predicate
      at the prompt to see how they work.  Make up your own. (2 lines)

   i.e.
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(5,2),A=C]).
    A = 5
    B = 9
    C = 5
    yes
    ?- applylist([=(A,5),is(B,+(4,5)),C is max(9,2),A=C]).
    no
  */




% 6. Define 
%    numOfAtoms(Lst, NofAtoms),
%   that counts the number of atoms in each list in Lst.  You may use a helper 
%   predicate (program).  Each list in Lst may contain atoms or compound terms.  
%   Count only atoms.  You can use the built in predicate atom. 
%   i.e.
%     ?- numOfAtoms([[a,aa,b,zon],[a,kk,zz],[er]],N).
%     N = 8
%     Yes





% 7. Define a program
%      numOfAtomsInNestedLists(Lst, NofAtoms),
%   that counts all the atoms in all the nested lists.  
%   YOU may assume the elements in Lst(or lists in Lst)
%   contain either atoms or lists but not complex terms.
%     ?-numOfAtomsInNestedLists([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
%     NA = 15
%     ?- numOfAtomsInNestedLists([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
%     NA = 15 




% 8.(easy- ONE relation)Define a predicate append3DL  
%   that concatenates three difference lists:

%  ?- append3DL( [z,y|A] - A, [x,w | B] -B, [u,v | C] - C, What).
%  What = [z, y, x, w, u, v | _n] - _n
%  yes




% 9. Define a prediate palindromeLst(Lst) that succeeds only it is a palindrome
% and every list in Lst is also a palindrome.  You may use a helper predicate
% DO NOT use the built in predicate reverse

% i.e.
%  ?- palindromeLst(["straw warts","avon sees nova" ,"straw warts"]).
%  Yes
%  ?- palindromeLst([[1,2,1],[4,4],[4,4],[1,2,1]]).
%  Yes
%  ?- palindromeLst([[1,d,1],"solos",[1,d,1]]).
%  Yes






% 10. Write a predicate countOcc(+Lst, LstPair). countOcc counts
% each element in Lst. The LstPair is a list of pairs with the first
% element is an element of Lst and the second element is the number of
% times it appears.

%  i.e.
%       ?- countOcc([1,2,4,1,1,3,4],CO). 
%	CO = [ (1, 3), (2, 1), (4, 2), (3, 1)] 
%       Yes ?- countOcc("a boy	and a body",CO). 
%       CO = [ (97, 3), (32, 4), (98, 2), (111, 2),(121, 2), (110, 1),(100, 2)] 
%       Yes





