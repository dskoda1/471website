/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/

%1: Knapsack


%2. sumit(List,Sum).  ---like --- single(List,SingleList)
single([H|T],LevelList) :- single(H,LevelHead),
                          single(T,LevelTail),
                          append(LevelHead,LevelTail,LevelList).
single([],[]).
single(X,[X]).
% extra credit with cuts.

sumit([H|T],Sum):- sumit(H,SumHead),sumit(T,SumTail),Sum is SumHead+SumTail,!.
sumit([],0).
sumit(X,X).




%3. append3DL(DL1, DL2, DL3, WHAT).
append3DL(L-M, M-N, N-P, L-P).


%4. Puzzle
getDigit(1).
getDigit(2).
getDigit(3).
getDigit(4).
getDigit(5).
getDigit(6).
getDigit(7).
getDigit(8).
getDigit(9).


puzzle(R1,R2,R3,R4):-
	R1=(R1C1,R1C2,R1C3,R1C4),
	R2=(R2C1,R2C2,R2C3,R2C4),
	R3=(R3C1,R3C2,R3C3,R3C4),
	R4=(R4C1,R4C2,R4C3,R4C4),
	R1C2 =5, R2C4=5, R3C3=1, R4C1=9,
	getDigit(R1C3),
	getDigit(R1C1),
	getDigit(R1C4),
	20 is R1C1+R1C2+R1C3+R1C4,
	getDigit(R2C1),
	getDigit(R2C2),
	getDigit(R2C3),
	27 is R2C1+R2C2+R2C3+R2C4,
	getDigit(R3C1),
	getDigit(R3C2),
	getDigit(R3C4),
	17 is R3C1+R3C2+R3C3+R3C4,
	getDigit(R4C2),
	getDigit(R4C3),
	getDigit(R4C4),
	21 is R4C1+R4C2+R4C3+R4C4,
	
	20 is R1C1+R2C1+R3C1+R4C1,
	25 is R1C2+R2C2+R3C2+R4C2,
	12 is R1C3+R2C3+R3C3+R4C3,	
	28 is R1C4+R2C4+R3C4+R4C4,	
	24 is R1C1+R2C2+R3C3+R4C4,
	36 is R1C4+R2C3+R3C2+R4C1.


%5. fillr(X,N,L)
% Given:

fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L).

fillr(X,0,[]):-!.  
fillr(X,N,[X|T]) :- Nx is N-1,fillr(X,Nx,T).


