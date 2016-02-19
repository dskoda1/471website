/* E Head   Programming Languages cs471        Jan, 2001 */
/* Some examples that compiled in SWIPL 3.2.8 */
/* Unix format-- (On windows platforms use Wordpad to edit) */
:-dynamic
fibfact/2.


% SAVE AS 'example.pl' in your prolog code directory
% To use:    Start swipl executing

% In swipl type at the "?-" prompt
%       [example].
% Once in swipl you can also invoke the editor by typing
% 	edit(example).

% Helpful hints:

% DO NOT put a space between the predicate name and the '(' .
% Swipl was developed for unix so to check the names of files in
%     current directory type:
% 	ls.
% To change directory type:
% 	chdir('newdir').
% To get help on "built-ins" type
% 	help(...).
% ... is the builtin predicate name.

% In the windows environment you double click on the the file name
%       and swipl starts to execute the file

% REMEMBER to get out of swipl type:
% ?- halt.
%
mylen([],0).
mylen([H|T], N):- mylen(T,NT), N is NT+1.


/* ************************************************************* */
/* Recursion- addToSet */
addToSet( X, L, L) :- member( X, L).
addToSet( X, L, [X|L]).

/* Add a cut to disallow spurious answers  */
addToSet2( X, L, L) :- member( X, L), !.
addToSet2( X, L, [X|L]).

/* ************************************************************* */

/* PERMUTATION */
% Why does
%  permutation( L, [1,2,3]).
% Have the following problem?
%     [WARNING: Out of local stack
%     Execution Aborted
%


permutation(X,[Y|Ys]):-deleteG(Y,X,Z),permutation(Z,Ys).
permutation([],[]).
   % What would happen if instead of deleteG I named my functor delete ?

deleteG(Z,[ X| Y ],[X|T]):-deleteG(Z,Y, T).
deleteG(X,[X|Y],Y).

/* ************************************************************ */

/* EXAMPLE from Prolog notes on family */
 % FACTS
 mother(mary,ann).
 mother(mary,joe).
 mother(sue,mary).

 father(mike,ann).
 father(mike,joe).

 % WHY is it helpful to have the grandparent fact
 %     even though it is redundant?

 grandparent(sue,ann).


 % RULES
 grandparent(X, Z) :- parent(X, Y),parent(Y, Z).

 parent(X, Y) :- mother(X, Y).
 parent(X, Y) :- father(X, Y).

 % Why does the predicate "?- sibling(X,Y)."
 %        produce 4 set of answers when there is really only one?

 sibling(X, Y) :-  parent(P, X),  parent(P, Y), not(X = Y) .



 both-parent-sibling(X, Y) :-  mother(M, X), mother(M, Y),
                               father(F, X), father(F, Y), X \= Y.


/* *************************************************************** */
 % Illustration of write & nl
 % Note write and nl are Deterministic (ie They can not be resatisfied.)
 % listOf(L) Prints out the elements in a list.

 % What happens if I change the order of the statements?
 % What happens if the elements are lists themselves?
 %

 listOf([H|[]]):- write(H), nl.                   % line feed
 listOf([H|T]):- write(H), write(','), listOf(T). % Displaying

/* *************************************************************** */
 % fragile-zeros Generates corrent answer then continues to generates
 %               incorrect answers.
 % 1) Why does fragile-zeros finds wrong answers after it finds the correct
 %    answer?
 % 2) What happens when you change the order of the statements?
 %    Does it still produce the same result if statement 3 is first? 
 %    Does it still produce the same result if statement 2 is first?
 % 3) Which is the best order? why?
 %
 % Will produce a warning because the compiler like to have all facts together

  fragileZeros([],0).                                             %statement 1
  fragileZeros([0|Tail],Z):- fragileZeros(Tail,Z1), Z is Z1 + 1. %Statement 2
  fragileZeros([_|Tail],Z):- fragileZeros(Tail,Z).               %statement 3


/* *************************************************************** */
 % exponential growth of recursive calls!
 % What does the code for the below look like in a
 %             procedurial language like C/Pascal/C++ etc?
 %

 fibonacci(S,1):- S =< 2.
 fibonacci(S,F):- S > 2, S1 is S - 1,
                  S2 is S -2,
                  fibonacci(S1,F1),
                  fibonacci(S2,F2),
                  F is F1 + F2.

/* *************************************************************** */
 % exponential growth of recursive calls!
 % What does the code for the below look like in a
 %             procedurial language like C/Pascal/C++ etc?
 %

 fibonacci2(S,F):- fibfact(S,F).

 fibonacci2(S,F):- S > 2, S1 is S - 1,
                  S2 is S -2,
                  fibonacci2(S1,F1),
                  fibonacci2(S2,F2),
                  F is F1 + F2,
		  asserta(fibfact(S,F)).

fibfact(1,1).
fibfact(2,1).


/* *************************************************************** */
 fibonacci_3( 1,1).  % Just to generate the first fibonacci number.

 fibonacci_3( SeqNo, FIB):-  fib_aux( 2,  SeqNo, 1, 1, FIB ).

 % F1 F2 and M are auxilary variables.  Why are they good to use?
 % This is an example of Dynamic Programming meta technique
 % How would you apply this technique to a
 %                   procedurial language like C/Pascal/C++?
 %

 fib_aux( SeqNo, SeqNo, _, FIB, FIB ).                        % stop
 fib_aux( M, SeqNo, F1, F2,  Fib )  :- M < SeqNo,
               NextM is M + 1,
               NextF2 is F1 + F2,
               fib_aux(NextM, SeqNo, F2, NextF2, Fib).



/* ************************************************************* */
 % These three rules axiomatize Eudlid's greatest common divisor algorithm.
 % Fischer & Grodzinsky, The anatomy of Programming languages, page 354
 %    gcd ( +Number1, +Number2, -TheGreatestCommonDivisor)
 %
 gcd( A, 0, A ).
 gcd( A, B, D ) :- (A>B), (B>0), R is A mod B, gcd( B, R, D ).
 gcd( A, B, D ) :- (A<B), gcd( B, A, D ).

/*  ANOTHER WAY  */
gcd2(U,V,X) :- min(U,V,M), greatestDivisor(U,V,M,X).

greatestDivisor(U,V,M,M) :- divides(U,M), divides(V,M), !.
greatestDivisor(U,V,M,X) :- N is M-1, greatestDivisor(U,V,N,X).

min(U,V,U) :- U < V.
min(U,V,V) :- U >= V.

divides(U,M) :- N is U mod M, N = 0 .

/* END of gcd2 */

/* ************************************************************* */

 % Example to show a warning message that will help you debug your
 % prolog.  { Don't forget trace, spy(relation), listing(relation)  }
 %
 % I intend for 'Warning' to be on both side of the rule.  Look
 % what at the message after the file is loaded ('[example].')
 % Notice the below syntax is correct.

   someThing(3).
   someThing(Warning) :- Warning2 is Warring + 1, someThing(Warning2).

/* ************************************************************* */
  % Example for cuts

  q(ed).
  r(fred, ted).
  r(fred, ed).
  s(ed).
  t(fred).

  p(X):- q(X).
  p(X):- r(X, Y), !, s(Y).
  p(X):- t(X).

/* ************************************************************ */
 % max( X,Y,Z) is true if Z is the maximum of X & Y

   max( X, Y, X) :- X >= Y.
   max( X, Y, Y) :- X < Y.

 % max1 same as above but with cut.

   max1(X, Y, X) :- X >= Y, !.
   max1( X, Y, Y) :- X < Y.

 % max2 same as above but works properly only if third argument is unknown
 % ?- max2(4, 3, 3). produces yes!!!
 % Experiment by leaving off the cut below.
 %               moving the cut right after :-
 %

   max2(X, Y, X) :- X >= Y, !.
   % Warning produced because X is just a "variable holder".  
   max2( X, Y, Y).
/* ************************************************ */

% From notes:

mymember( X , [X | _ ] ).
mymember( X , [ _ | Z ] ) :-  mymember( X , Z ).

haveCommonElts1( X ,Y ) :-  mymember( E, X ), mymember( E, Y ).


/***********************************************/


squares( [ ], [ ] ).
squares([N|T ],[S|ST ]) :- S is N*N,  squares( T, ST).

sq( [ ], [ ] ).
sq( [N|T ], [S|ST ] ) :-  sq( T, ST),  S is N*N.



/********************************************/
%%%  Difference Lists.  %%%
/********************************************/

appendDL(L-M, M-N, L-N).

simplify( X -Y,[] ):- X == Y.
simplify( [X|Y]-Z,[X|W] ):- simplify(Y-Z,W).


/* ************************************** */
% Reading from a keyboard then displaying the string
% When keyBoard is in a list of subgoals the '!' prevents keyBoard
% from being restarted by the failure of a subsequent goal.
%
% get0 inputs characters from the keyboard.
% put displays characters and C = 10 signals an end of line.
keyBoard :- repeat, get0(C), put(C), C = 10, !.

/* ************************************** */
% for loop:
% for index = start, finish
for(I,I,I) :- !.     %R1
for(I,I,_).       %R2
for(Index,Start,Finish) :-    N is Start+1,
               for(Index,N,Finish). %R3

printint(S,F) :-  for(I,S,F),
                   write(I),
                   nl, fail.

/* ****** loop from N downto 0  ************* */
/* From Understanding Programming Languages by M. Ben-Ari  */
/* page 340  */

loopB(0).  %STOP
loopB(N) :- write(N),nl, N1 is N -1, loopB(N1).

% Generate and test (636 - Scott)

natural(1).
natural(N) :- natural(M), N is M+1.

loop(N) :-natural(I), I =< N, write(I), nl, I=N, !.


qsort( [P|L], Outlist):- partition( P,L,Small,Large),
                         qsort(Small,Localsmall), 
                         qsort(Large,Locallarge),
			 append(Localsmall, 
			 [ P |Locallarge],Outlist).  
qsort( [ ], [ ] ).


