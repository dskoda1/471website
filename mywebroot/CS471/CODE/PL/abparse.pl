% You can use any symbol as a terminal characters.  
% If you use a capital letter you must enclose it with '' otherwise
% Prolog will interpret it as a variable.
% In sabTree you see that 'A','B','S' are used as atoms because of ' '.


% {a^n b^n} recognizer.
% s([a,a,a,b,b,b],[]).  yes
% s([a,a,b,b,a,a,b,b,],[]). no


s --> [a],[b].
s --> [a], s, [b].

/* Prolog converts the above grammar to:   ----(reworded)
   sConvert(Sentence,Acc):- 'C'(Sentence,a,C),'C'(C,b,Acc).
   sConvert(Sentence,Acc):- 'C'(Sentence,a,C),s(C,D),'C'(D,b,Acc).
   'C'([A|B],A,B).
*/
    

% {a^n c b^n} recognizer.
sn --> as,sn,bs.
sn -->[c].
as-->[a].
bs-->[b].


% sabTree(ParseTree,[a,a,a,b,b,b],[]).
sabTree('S'(A,SN,B))--> a(A),sabTree(SN),b(B).
sabTree('S'(a,b))-->[a],[b] .
a('A'(a))-->[a].
b('B'(b))-->[b].

% sx(ParseTree,[a,a,a,c,b,b,b],[]).

sx('S'(A,SN,B))--> ax(A),sx(SN),bx(B).
sx('S'(C))--> cx(C).
ax('A')-->[a].
bx('B')-->[b].
cx('C')--> [c].

/* prolog converts to...
  sx('S'(A,B,C),D,E):- ax(A.D,F),sx(B,F,G),bx(C,G,E).
  sx('S'(A),B,C):- cx(A,B,C).
  ax('A'(a),[a|A],A).
  bx('B'(b),[b|A],A).
  cx('C'(c),[c|A],A).
 */





% {1^n 0^n} recognizer.
% s([1,1,0,0],[]).  yes
% s([1,1,0,0,1,1,0,0,],[]). no


sZ --> [1],[0].
sZ --> [1], sZ, [0].


% Recognize assignment statements

parseA --> id,[:=],expr.
id -->['A'].
id -->['B'].
expr --> term,[*],expr.
expr --> term.
term --> factor, [+], term.
term --> factor.
factor --> id.
factor --> ['('],expr,[')'].
