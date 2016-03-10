% {a^n b^n} recognizer.
% s([a,a,a,b,b,b],[]).  yes
% s([a,a,b,b,a,a,b,b,],[]). no


s --> [a],[b].
s --> [a], s, [b].


sConvert(Sentence,Acc):- 'C'(A,a,C),'C'(C,b,B).
sConvert(Sentence,Acc):- 'C'(A,a,C),s(C,D),'C'(D,b,B).
'C'([A|B],A,B).


% Because of the depth first nature of the search in Prolog 
%  left recursion must be removed.

% 1) Using same number of letters but performing the grammar transformation 
% to remove left recursion.

s-->l,e,r.
s-->l,e,r,s.  	
s-->l,s,r.
s-->l,s,r,s.      %first two statements are the equivalent of saying s+
e-->[exp].
l-->[lb].
r-->[rb].


% 2) Using one extra letter to remove left recursion
a-->[].  % ?? 
a-->s,a.        %a is equivalent to s+ in regular expressions
s-->l,e,r.
s-->l,a,r.
e-->[exp].
l-->[lb].
r-->[rb].  

ass--> id , [':='], exp, [';'].
exp --> term, ['*'], exp.
exp --> term.
term --> factor, ['+'], term.
term --> factor.
factor --> ['{'],exp,['}'].
factor --> id.
id --> ['a'].
id --> ['b'].
id --> ['c'].


%main program.
go:- 
    repeat , 
    write('To quit enter ''quit.''') ,
    nl ,
    op(999, xfy, ';') ,
    read(Prog) , 
    op(1100, xfy, ';') ,
    ( Prog = quit ->
      true
      ;
      ass(Prog, []),
    write('parsed'),
    nl ,
    fail
    ).









