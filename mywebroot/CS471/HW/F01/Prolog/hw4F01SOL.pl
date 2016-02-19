/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
%1.

countChar([],_,0).
countChar([C|T],[C],A):-countChar(T,[C],N),!, A is N+1.
countChar([_|T],[C],N):-countChar(T,[C],N).

%2
countOcc(L,[C|Cs],[NC|NCs]):- countChar(L,[C],NC),countOcc(L,Cs,NCs).
countOcc(_,[],[]).


%3


%4: Ackermann's function --- MY Ackermann Number is 4.

ack(0,N,A) :- A is 2*N.
ack(M,0,0) :- M >=1.
ack(M,1,2) :- M >=1.
ack(M,N,A) :- N1 is N-1,ack(M,N1,A1) ,M1 is M-1, ack(M1,A1,A).






