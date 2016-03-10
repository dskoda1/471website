s --> [a],[b].
s --> [a], s, [b].

sn --> as,sn,bs.
sn -->[c].
as-->[a].
bs-->[b].


% sab(ParseTree,[a,a,a,b,b,b],[]).
sab('S'(A,SN,B))--> a(A),sab(SN),b(B).
sab('S'(a,b))-->[a],[b] .
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

%prog(PTree,[begin,'A',':=','B',+,'A',';','C',':=','B',';',end],[]),pp(PTree).

prog('Program '(begin,P,end))--> [begin],stmtS(P),[end].
begin(begin)--> [begin].
end(end) --> [end].
stmtS('StmtList'(S))--> stmt(S).
stmtS('StmtList'(S,Ss))--> stmt(S),[;],stmtS(Ss).
stmt('Stmt ":=" '(V,E))--> var(V),[':='],exp(E).
var('<Var> A') --> ['A'].
var('<Var> B') --> ['B'].
var('<Var> C') --> ['C'].
exp('Exp "+"'(V1,V2))--> var(V1),[+],var(V2).
exp('Exp "-"'(V1,V2))--> var(V1),[-],var(V2).
exp('Exp'(V))--> var(V).





pp(T):- pp(T,0).

pp(T, Indent):-
	atomic(T) ,
	nl,
	tab(Indent) , 
	write(T).

pp(T, Indent):-
	T =.. [Functor|Args] ,
	Args = [_|_] ,
	nl ,
	tab(Indent) , 
	Indent1 is Indent + 6 ,
	write('<<') ,
	write(Functor) , 
	ppArgs(Args, Indent1) ,
	nl,
	tab(Indent),
	write(Functor),
	write('>>').


ppArgs([A], Indent):-
  tab(Indent) ,
  pp(A, Indent).

ppArgs([A|As], Indent):-
  As = [_|_] ,
  tab(Indent) ,
  pp(A, Indent) ,
  % nl ,
  write(' ') ,
  ppArgs(As, Indent).




