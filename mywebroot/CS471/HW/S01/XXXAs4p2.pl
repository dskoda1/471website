/* The purpose of this assign is
   1) To show you how to do constrant based programming
   2) The ability of prolog code to dynamically change itself.
   3) The use of backtracking to easily solve a problem.
   
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  YOUR NAME    CS471   Spring 2001
%
% The 0-1 KnapSack decision problem is  solved by depth first search.
%
% See section 5.7 of Neapolitan&Naimipour, Foundations Of Algorithms
%      for a description of the problem.  
%
%   The goal is to fill the sack with a subset of the given items such that
%            the sack has total weight <= MaxWeight and
%                     has total profit= Profit.
%  
% To run the program type:
%        ?- knapSack01(sack(TotalWeight,Profit),SACK).
%  i.e.
%  ?- knapSack01(sack(12,90),S).
%  S = [item(1,40,2,20), item(3,50,10,5)];
%  No
%  ?-  knapSack01(sack(7,90),S).
%  No
%  ?-  knapSack01(sack(10,40),S).
%  S = [item(1,40,2,20)];
%  S = [item(2,30,5,6), item(4,10,5,2);
%  No
%
% You should read about retract and assert, asserta, and assertz.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/************************
  Must include the following dynamic directives to allow dynamic addition
  and deletion of facts and rules.
  i.e. To allow assert,asserta,assertz and retract to work.
*********************/

:- dynamic (item/4).
:- dynamic (listitem/1).

% Neapolitan & Naimipour page 194 example 5.2
% Set of Items.
% Items are in descending order of profit/weight.
% There is a sentinel, item(end, 0, 0, 0) to signal no more items.  
% item(number, profit, weight, profit/weight).

item(1, 40, 2, 20).
item(2, 30, 5, 6).
item(3, 50, 10, 5).
item(4, 10, 5, 2).
item(end, 0, 0, 0).


/* Step one.  Create a list of items from the facts above.  Every time you
   add an element to the list the "retract" the fact from the data base.
   When the list have every is included in the list then add
   list(ListOfItems) to the program by "assert".
   To see that this works after the file is loaded and before you query type
       listing.
   You should see the 5 items listed out.  After you query addlist they will be
   gone.  To see they are missing type
       listing.
   If your rules are correct you will not see items but will now have one fact
   itemlist(...).
*/

/*  You will need to code mklist(List).  There will be a base case and a
    recursive rule.
    mklist(List) adds each item/4 except item(end,0,0,0) to a List after
    each item/4 is added it will be removed from the code.
*/

% You may use what I have started or do it your own way.
% You will get errors until you finish these rules.

mklist([H|T]) :- item(A,B,C,D),
	         A \= end ,  
		 % YOU WILL need to add 3 more subgoals.

mklist([]):- !, item(A,B,C,D),
	     A = end,
	     % add the last subgoal to remove item(end,0,0,0).

% addlist is complete, mklist builds the list
%                      asserta adds the fact itemlist(L), to the code.
addlist(L) :- mklist(L),
	      asserta(listitem(L)).    


% 0-1 Knapsack problem 
%  'The goal is to find a subset of the items that weights sums to Weight or
%   less and the total profit = Profit
% ?- knapsack01(sack(TotalWeight,Profit),SACK)
%  These are complete and correct if you follow my outline.

% First time we query a itemlist(...) must be added to the database.
knapSack01(sack(TotalWeight,Profit),SACK):- addlist(L),!,
	                                 fullsack(TotalWeight,Profit,L,SACK).


% Future queries will use the fact itemlist(...).
knapSack01(sack(TotalWeight,Profit),SACK):- itemlist(L),!,
	                                 fullsack(TotalWeight,Profit,L,SACK).


% Found items with total profit desired and
%  total weight less weight held by sack.  This is complete and correct.
fullsack(Wgt,0,_,[]):- Wgt >= 0.


% Add Item to Sack
fullsack(Wgt,Pro,[H|T],[H|SackT]):- H=item(_,P,W,_),  %add subgoals


% Do not add Item to Sack
fullsack(Wgt,Pro,[_|T],Sack):-Pro > 0,  %additional subgoal required.

