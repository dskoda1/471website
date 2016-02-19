%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  YOUR NAME    CS471   Fall 2003
%
% The 0-1 KnapSack problem solved by depth first search.
%
% See section 5.7 of Neapolitan&Naimipour, Foundations Of Algorithms
%      for a description of the problem.  
%
%   The goal is to fill the SACK with a subset of the ListOfItems such that
%            the sack has total weight <= TotalWeight and
%                     has total profit= Profit.
%  
% To run the program type:
%        ?- knapSack01(sack(TotalWeight,Profit),SACK).
%
% You should read about retract and assert, asserta, and assertz.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/************************
  Must include the following dynamic directives to allow dynamic addition
  and deletion of facts and rules.
*********************/

:- dynamic (item/4).
:- dynamic (listitem/1).

% Neapolitan & Naimipour page 194 example 5.2
% Set of Items.  item(0,0) is always include.
% item(number, profit, weight, profit/weight).

item(1, 40, 2, 20).
item(2, 30, 5, 6).
item(3, 50, 10, 5).
item(4, 10, 5, 2).
item(end, 0, 0, 0).

/* required responsives:
  (Is there a sack containing items above 
   with a weight <= 20 and a profit of $80 ?)
  
   ?- knapSack01(sack(20,80),S). 
   S = [item(1, 40, 2, 20), item(2, 30, 5, 6), item(4, 10, 5, 2)] ;
   S = [item(2, 30, 5, 6), item(3, 50, 10, 5)]
   Yes

   (Is there a sack containing items above
    with a weight <= 12 and Profit of $90?)

   ?- knapSack01(sack(12,90),S).
   S = [item(1, 40, 2, 20), item(3, 50, 10, 5)]
   Yes
*********/

/* You may follow my suggestions or do it on your own solution.
   Step one.  Create a list of items from the facts above.  Every time you
   add an element to the list the "retract" the fact from the data base.
   When the list have every is included in the list then add
   list(ListOfItems) to the program by "assert".
   
*/


mklist([H|T]) :- item(A,B,C,D),
	         A \= end ,
		 item(A,B,C,D)= H,
		 retract(H),
		 mklist(T).

mklist([]):- H = item(A,B,C,D),
	     A = end,
	     retract(H).



addlist(L) :- mklist(L),
	      asserta(itemlist(L)).


% 0-1 Knapsack problem
%  'The goal is to find a subset of the items that weights sums to Weight or
%   less and the total profit = Profit
% ?- knapsack01(sack(TotalWeight,Profit),SACK).
% Note: knapSack01 gets the execution going.


knapSack01(sack(TotalWeight,Profit),SACK):- addlist(L),
	                                 fullsack(TotalWeight,Profit,L,SACK).


knapSack01(sack(TotalWeight,Profit),SACK):- itemlist(L),
	                                 fullsack(TotalWeight,Profit,L,SACK).


% Write the code for fullsack:
%  2 recursive rules and one base case.
% 
%   fullsack(Weight, Profit, ListOfItems, SackList)



