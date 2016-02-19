/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/
%1 countOcc( List, Element, Count)


%2. Map coloring problem
% Coloring facts either 6 = 4*3/2 combinations or 12 = 4*3 permutations
% 
% Helper rules to get the adjacent colors.

% 
mapcolors(A,B,C,D,E,F,G):-  % complete the subgoals for map given in HW.



%3.  Knapsack problem do in file XXXAs4p2.pl  SEE knapsackSOL.pl


%4. Ackermann's function --- MY Ackermann Number is 4.



%5.
%**********************************************************
%     myMerge(+List1, +List2, -Result):
%     Combines two sorted lists of atoms into a sorted list
%     ?- myMerge([abc,f,wxy,z],[aabc,fg,xyz,y],R].
%     R = [aabc, abc, f, fg, wxy, xyz, y, z];
%     no (if you use cuts...  Extra credit. )
%**********************************************************
% I used a cuts


%6.Implement partition (+List, -List1, -List2), that divides List in two parts
%    List1, List2 of about equal size.
%        ?- partition([1,2,3], L1, L2).
%        L1 = [1,3] %% or order or elements do not matter for correct solution
%        L2 = [2]
%        yes
%        ?- partition([1,2,3,4],L1,L2).
%        L1 = [1,3]
%        L2 = [2,4]
%        yes
% Base case and one recursive rule.  Easy.
% I used cut to allow only one possible partition
	

%7. mergesortX( List, Sorted).
% Sorts List giving Sorted using Mergesort algorithm
% ?-mergesortX([abc,xzy,bz,az], Sorted).
% Sorted = [abc,az,bz,xzy].
%


% List has at least 2 elements -- I used a cut.
mergesortX( [First, Second | Rest], Result) :-


% Base case: List has 0 or 1 elements



%8. single(List,SingleList)



%9. append3DL(DL1, DL2, DL3, WHAT).



%10. fillr(X,N,L)
% Given:

fill(X,N,L) :- length(L,N), append([X],Lx,L), append(Lx,[X],L).




