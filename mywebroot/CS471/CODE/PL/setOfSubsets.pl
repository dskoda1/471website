%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Eileen Head    CS471   Spring 2000
%
% The SUM of subsets problem solved by depth first search.
%
%  See http://www.math.sunysb.edu/~scott/blair/Subset_sum_problems_are.html
%  for a description of the Sum of Subsets problem.   
%
%   We want to find all subsets of the given integers that sum to W.
%   The GOAL is successful when the sum of the weight of subsets = Weight
%            where Weight is given in setOfSubsets(Weight)   ---- below.
%   The user can change the Total Weight by
%        ?- retract(setOfSubsets(21)).
%        ?- asserta(setOfSubsets(YOURNUMBER)).
%  Where YOURNUMBER is any new weight.
%  
% To run the program type:
%        ?- sumOfSubset(SubSet).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% setOfSubsets(Weight).
setOfSubsets(21).

% Neapolitan & Naimipour page 194 example 5.2
% Set of Items.  item(0,0) is always include.
%item(number, weight).
item(0, 0).
item(1, 5).
item(2, 6).
item(3, 10).
item(4, 11).
item(5, 16).

% Sum of Subset problem - 
%  'The goal is to find all subset of the integers that weights sums to Weight
% ?- sumOfSubset(SubSet).

sumOfSubset(SubSet):- solve(subTot(0,0,item(0,0)),Solution),setList(Solution,SubSet).


solve(N, [N]) :- goal(N),!.
solve(N, [N | Sol1]) :- s(N, N1), solve(N1, Sol1).

goal(subTot(_, Totalweight,_)) :-
                                 setOfSubsets(Goalweight),
                                 Totalweight = Goalweight.

%s rules:  Add the item if possible else skip the item.

s(subTot(NumItem,Weight1,_), subTot(Num2Item, Weight2,NextItem)) :- 
                                       Num2Item is NumItem + 1,
                                       item(Num2Item,W),
                                       NextItem=item(Num2Item,W),
                                       Weight2 is Weight1 + W.

s(subTot(NumItem,Weight1,Item), subTot(Num2Item, Weight1,Item)) :-
                                       Num2Item is NumItem + 1,
                                       item(Num2Item,_).


%%
% setList rules: Create a list of items from the list of solutions created
%                by solve(ListOfSolutions,[ListOfSolutions]).  So the SubSet
%                from sumOfSubset(SubSet) is just a list of item(I,W).
%%
setList([], []).
setList([subTot(_,_,I),subTot(N,W,I)|T],L) :-!,setList([subTot(N,W,I)|T],L).
setList([subTot(_,_,I)|T],[I|LT]) :- !,setList(T,LT).





