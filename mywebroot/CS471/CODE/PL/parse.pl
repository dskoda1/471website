/*

This is a trivial Prolog program which translates a programs in 
Appel's straight-line programming language to Java constructor
calls to build up an AST for the program.

To run this program, change to the directory this program is in and
start up Prolog by simply typing 'swipl' at the Unix shell prompt (in
case, it is not in your path, the relevant path is /opt/local/bin).
Then at the Prolog ?- prompt, load in this program by typing
'[parse].' and start it by simply typing 'go.' (the period is
important).  At the prompt, type your program (terminated by a
period).  Repeat this as many times as necessary; you can paste the
resulting output into your Java test program.  When done, type
'quit.', to terminate the program, and 'halt.'  to quit Prolog.

A log of an example session follows:

------------------------------------------------------------------------
bingsun2% cd ~/cs572s99/projects/prj1
bingsun2% swipl
Welcome to SWI-Prolog (Version 2.7.10)
Copyright (c) 1993-1996 University of Amsterdam.  All rights reserved.

For help, use ?- help(Topic). or ?- apropos(Word).

1 ?- [parse].
[parse].
parse compiled, 0.01 sec, 5,888 bytes.

Yes
2 ?- go.
Enter Appel straight-line program, terminated by a '.'
To quit enter 'quit.'
|: a:= 3; print(a*4, a+3).
    new CompoundStm(
            new AssignStm(
                "a",
                new NumExp(
                    3)),
            new PrintStm(
                new PairExpList(
                    new OpExp(
                        new IdExp(
                            "a"),
                        OpExp.TIMES,
                        new NumExp(
                            4)),
                    new LastExpList(
                        new OpExp(
                            new IdExp(
                                "a"),
                            OpExp.PLUS,
                            new NumExp(
                                3))))))
Enter Appel straight-line program, terminated by a '.'
To quit enter 'quit.'
|: a:= (print(1+2), 3); print(a).
    new CompoundStm(
            new AssignStm(
                "a",
                new EseqExp(
                    new PrintStm(
                        new LastExpList(
                            new OpExp(
                                new NumExp(
                                    1),
                                OpExp.PLUS,
                                new NumExp(
                                    2)))),
                    new NumExp(
                        3))),
            new PrintStm(
                new LastExpList(
                    new IdExp(
                        "a"))))
Enter Appel straight-line program, terminated by a '.'
To quit enter 'quit.'
|: quit.

Yes
3 ?- halt.
bingsun2% 
------------------------------------------------------------------------

*/

:- op(700, xfx, ':=').   %assignment operator.  

%Prolog does all the parsing.  All we do is translate.  So the predicates
%below are poorly named.

parseStm((Stm1 ; Stm2), 'new CompoundStm'(S1, S2)):-
  parseStm(Stm1, S1) ,
  parseStm(Stm2, S2).

parseStm(ID:= Exp, 'new AssignStm'(IDStr, ExpTree)):-
  strName(ID, IDStr) ,
  parseExp(Exp, ExpTree).

parseStm(Print, 'new PrintStm'(ExpListTree)):-
  Print =.. [print|ExpList] ,
  parseExpList(ExpList, ExpListTree).

parseExp(ID, 'new IdExp'(IDStr)):-
  atom(ID) ,
  strName(ID, IDStr).

parseExp(Num, 'new NumExp'(Num)):-
  integer(Num).

parseExp(E1 + E2, 'new OpExp'(E1Tree, 'OpExp.PLUS', E2Tree)):-
  parseExp(E1, E1Tree) ,
  parseExp(E2, E2Tree).

parseExp(E1 - E2, 'new OpExp'(E1Tree, 'OpExp.MINUS', E2Tree)):-
  parseExp(E1, E1Tree) ,
  parseExp(E2, E2Tree).

parseExp(E1 * E2, 'new OpExp'(E1Tree, 'OpExp.TIMES', E2Tree)):-
  parseExp(E1, E1Tree) ,
  parseExp(E2, E2Tree).

parseExp(E1 / E2, 'new OpExp'(E1Tree, 'OpExp.DIV', E2Tree)):-
  parseExp(E1, E1Tree) ,
  parseExp(E2, E2Tree).

parseExp((Stm, Exp), 'new EseqExp'(StmTree, ExpTree)):-
  parseStm(Stm, StmTree) ,
  parseExp(Exp, ExpTree).

parseExpList([Exp], 'new LastExpList'(ExpTree)):-
  parseExp(Exp, ExpTree).

parseExpList([Exp|Exps], 'new PairExpList'(ExpTree, ExpsTree)):-
  Exps = [_|_] ,
  parseExp(Exp, ExpTree) ,
  parseExpList(Exps, ExpsTree).

strName(ID, IDStr) :-
  name(ID, IDChars) , 
  Quote = 0'" ,
  append(IDChars, [Quote], IDChars1) ,
  name(IDStr, [Quote|IDChars1]).

%Simple-minded pretty printer.
pp(T):-
  pp(T, 0).

pp(T, Indent):-
  atomic(T) ,
  tab(Indent) , 
  write(T).

pp(T, Indent):-
  T =.. [Functor|Args] ,
  Args = [_|_] ,
  tab(Indent) , 
  write(Functor) , 
  write('(') ,
  nl ,
  Indent1 is Indent + 2 ,
  ppArgs(Args, Indent1) ,
  write(')').

ppArgs([A], Indent):-
  tab(Indent) ,
  pp(A, Indent).

ppArgs([A|As], Indent):-
  As = [_|_] ,
  tab(Indent) ,
  pp(A, Indent) ,
  write(',') ,
  nl ,
  ppArgs(As, Indent).

%main program.
go:- 
  repeat , 
    write('Enter Appel straight-line program, terminated by a ''.''') ,
    nl ,
    write('To quit enter ''quit.''') ,
    nl ,
    op(999, xfy, ';') ,
    read(Prog) , 
    op(1100, xfy, ';') ,
    ( Prog = quit ->
        true
      ;
      parseStm(Prog, ProgTree) , 
      pp(ProgTree, 4) , 
      nl ,
      fail
    ).
