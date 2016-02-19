/* Assume all arguments are sets.  i.e. The list contain unique elements */

% 1:
% This code includes the "!".
% intersect(+setA, +setB, -intersect).

intersect([ ], _, [ ]).
intersect([X|R], Y, [X|Z]) :-
	  member( X, Y ),
	  !,
	  intersect( R, Y, Z ).

intersect([_|R ], Y, Z ) :-  intersect( R, Y, Z ).

% 2: Same code as problem 1, except the "!" is removed.
% How does intersectX behave different than intersect?
% How does intersectX behave the same as intersect?
% intersectX(+setA, +setB, -intersect).

intersectX([ ], _, [ ]).
intersectX([X|R], Y, [X|Z]) :-
	  member( X, Y ),
	  intersectX( R, Y, Z ).

intersectX([_|R ], Y, Z ) :-  intersectX( R, Y, Z ).


% An interesting try.
% Why does this go into an infinite loop for
% ?- intersectN([1,2],[3,2,1],I).
% Use trace or gtrace to verify your hypothesis.
%

intersectN(A,B,[IntersectH|T]):-
	member(IntersectH,A),
	member(IntersectH,B),
	intersectN(A,B,T).

% This is will not stop the infinite loop --
% intersectN(A,B,[IntersectH|T]):-
%	intersectN(A,B,T).

intersectN(_,_,[]).



%intersectY(+setA, +setB, -intersect).

intersectY(A,B,[IntersectH|T]):-
	member(IntersectH,A),
	member(IntersectH,B),
	!,
	select(IntersectH,A,RA),
	select(IntersectH,B,RB),
	intersectY(RA,RB,T).


intersectY(_,_,[]).

% Compare the behavior of intersectY and intersectZ.

intersectZ(A,B,[IntersectH|T]):-
	member(IntersectH,A),
	member(IntersectH,B),
	select(IntersectH,A,RA),
	select(IntersectH,B,RB),
	intersectZ(RA,RB,T).

intersectZ(_,_,[]).


