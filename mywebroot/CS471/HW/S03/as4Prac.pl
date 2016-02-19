
%5 accumProd(+Lst, RLst):  Given a list, Lst accumProd creates/checks that RLst is a list of the running product of all the numbers of  Lst from right to left.  
%i.e.

 %   ?- accumProd([3,2,5,2],R).
 %  R = [60, 20, 10, 2]
 %   ?- accumProd([3,4,5,6,0.5],R).
 %   R = [180, 60, 15, 3, 0.5] 







%5  accumProd(+Lst, RprodLst).
accumProd([],[]).  % just to allow empty list.
accumProd([V],[V]).
accumProd([H|T],[RH,RP|RT]):-accumProd(T,[RP|RT]),
	RH is H * RP.
