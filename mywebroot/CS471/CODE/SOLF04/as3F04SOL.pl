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

bagToSet([],[]).
bagToSet([B|Bt],S):- member(B,Bt),!,bagToSet(Bt,S).  
%cut not required.extra credit
bagToSet([B|Bt],[B|St]):- bagToSet(Bt,St).


bagToSet2([],[]).
bagToSet2([B|Bt],S):- delete(B,Bt,Bd),!,bagToSet(Bd,S).  



% 2. Define a predicate, prod(+Lst, Prod).  You may assume that Lst
%   is a non empty list of numbers.

prod([N],N).
prod([N|T],P):- prod(T,Px), P is N * Px. 

% 3. prodRtoL(+L,?S).
/* Given a non empty list of numbers, L, 
   S is a list of the prod of the numbers in L such
   that first number in S is the prod of all the number L, the second number 
   in S the prod of all the numbers in L except the first number in L, etc.
   For example:
   3 ?- prodRtoL([1,2,3,4],S).
   S = [10, 9, 7, 4]
*/ 

 prodRtoL([X],[X]).
prodRtoL([H|T],[H1,H2|TS]):-  prodRtoL(T,[H2|TS]),H1 is H2 * H.


% 4. prodLtoR(L,S).  
/* Is simular to prodRtoL(+L,?S), except that prod totals 
   accumulate left to right.

     13 ?- prodLtoR([1,2,3,4],S).
     S = [1, 3, 6, 10] 

*/


prodLtoR([H],[H]).
prodLtoR([H,H1|T],[H|TS]):- Replace is H1 * H, prodLtoR([Replace|T],TS).


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

applylist([H|T]):-H,applylist(T).
applylist([]).

% 6. Define 
%    numOfAtoms(Lst, NofAtoms),
%   that counts the number of atoms in each list in Lst.  You may use a helper 
%   predicate (program).  Each list in Lst may contain atoms or compound terms.  
%   Count only atoms.  You can use the built in predicate atom. 
%   i.e.
%     ?- numOfAtoms([[a,aa,b,zon],[a,kk,zz],[er]],N).
%     N = 8
%     Yes


numOfAtoms([H|T],NA):- countAtom(H, NAinH), numOfAtoms(T,NxA), NA is NAinH + NxA.
numOfAtoms([],0).
countAtom([H|T], NA):- atom(H), countAtom(T,NxA), NA is NxA + 1.
countAtom([H|T], NA):-  countAtom(T,NA).
countAtom([],0).


% 7. Define a program
%      numOfAtomsInNestedLists(Lst, NofAtoms),
%   that counts all the atoms in all the nested lists.  
%   YOU may assume the elements in Lst(or lists in Lst)
%   contain either atoms or lists but not complex terms.
%     ?-numOfAtomsInNestedLists([1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[x,c,v]],NA)
%     NA = 15
%     ?- numOfAtomsInNestedLists([[],[1,[a,s,d],[s,s,[1,4,5],[d,f,g]],[]],[x,c,v]],NA).
%     NA = 15 

numOfAtomsInNestedLists([H|T],NA):- 
	numOfAtomsInNestedLists(H,NH), 
	numOfAtomsInNestedLists(T,NT), 
	NA is NH + NT.

numOfAtomsInNestedLists([],0).
numOfAtomsInNestedLists(E,1).


% 8.(easy- ONE relation)Define a predicate append3DL  
%   that concatenates three difference lists:

%  ?- append3DL( [z,y|A] - A, [x,w | B] -B, [u,v | C] - C, What).
%  What = [z, y, x, w, u, v | _n] - _n
%  yes

append3DL(A-B, B-C, C-D, A-D).


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


palindromeLst([H|TL]):- append(RL,[H],TL),palindrome(H),palindromeLst(RL).
palindromeLst([]).
palindromeLst([X]).
palindrome([H|T]):- append(R,[H],TL),palindrome(R).
palindrome([]).
palindrome([S]).




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


countOcc([H|Ts],[(H,N)|NTs]):- count(H,Ts,Nx),N is Nx+1 ,delete(Ts,H,Tx),countOcc(Tx,NTs).
countOcc([],[]).
count(C,[C|Cs],N):- count(C, Cs, Nx), N is Nx +1.
count(C,[_|Cs],N):- count(C,Cs,N).
count(_,[],0).


