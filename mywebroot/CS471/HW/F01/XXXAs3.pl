/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
*/


/* 1. [easy] Write a predicate, doubleIT(L,R),  
       such that every element in R is A more than the corresponding element
       in L. i.e. 
             ?-doubleIT([1,2,4],X). 
             X = [2,4,8] 
             yes 
            ?- doubleIT(X,[10,4]). 
         You will get an error...Arguments are not sufficiently instantiated. 
*/

                   
/*  2.Write a predicate, hasDuplicate(T), which succeeds only if at 
      least one element in the list appears more than
      once.  You may use the built-in predicate member/2 i.e. 
                      ?- hasDuplicate([3,3,4]. 
                      yes 
                      ?- hasDuplicate([1,33,4]). 
                      no 
                      ?- hasDuplicate([a,b,d,e,f,d]). 
                      yes
*/

/*  3.Write a predicate, secondLast, that succeeds only for lists of 
      length greater than 1 and it "picks" the second from end of the list. 
                      ?- secondLast([a,b,c,d],S). 
                      S = c 
                      yes 
                      ?- secondLast([1],S). 
                      no
*/



/* 4.Write a predicate minList(-Min,+List), where Min is the minimum value 
     found in List. Assume list has at least one number. 
     You might want to use the built-in predicate, min(+expr,+expr). 
     Some experiments: 
                           ?- X is min(4,6). 
                           ?- X is min(4*3,10*30).
                      Your results should be: 
                      ?-  minList(Min,[13,5,33,2,6]). 
                      Min = 2 
                      yes.
 */                      
   
/* 5.Write a predicate lengthOfLists, given a list of lists compute the 
     total number of  elements in all the lists. i.e. 
                 ?-lengthOfLists([[1,2],[a,b,c]], L). 
                 L = 5 
                 yes 
                 ?- lengthOfLists([[],[],[abc],[123]],L). 
                 L = 2 
                 yes 
                 ?-lengthOfLists([[],[]],L). 
                 L = 0 
                 yes 
*/                   
              
/*  6.Define the relation,  zip(Z,X,Y),where Z is unified with zip(X,Y).  
      This is easy if you use pattern matching and unification. 
                      ?- zip(Z,a,b). 
                      Z = zip(a,b) 
                      yes 
*/                            
              
/* 7.Define a predicate zipLists(L,M,P), where it succeeds if  P is a list 
     of tuples, the first element is from the L and the second is from the 
     corresponding element in list M. 
                      ?- zipLists([1,5,9],[a,5,z],P). 
                      P = [zip(1,a),zip(5,5),zip(9,z)] 
                      yes 
                      ?- zipLists([1,5],[a,b,c],P). 
                      P = [zip(1,a),zip(5,b)]. 
                      yes 
                      ?- zipLists([1,5,99],[a,c],P). 
                      P = [zip(1,a),zip(5,c)] 
                       
*/
              
/* 8.Define a predicate, listOfPred(ListOfList,ListOfPred), where 
     each term in the ListOfLists is converted to a list of functors and 
     their arguments.See page 638 in Scott for information on the built-in 
     predicates functor and arg  i.e. 
        ?- listOfPred([ [=,3,5], [is,B,+(4,5)], [length,[1,2,3],3] ], LP). 
        B=_G521 
        LP=[3=5,_G521 is 4+5,length([1,2,3],3)]; 
        No 
        ?- listOfPred([],L). 
        L= [] 
        yes 
                        
*/
                       
            
/*  9.Given a list of predicates, applylist(L), succeeds only if each of 
      the predicates in the list succeeds. Note: the scope of variables 
      names is the entire list. You can apply each predicate at the prompt 
      to test how they work. 
      Make up your own test cases. i.e. 
                      ?- applylist([=(A,5),is(B,+(4,5)),C is max(5,2),A=C]). 
                      A = 5 
                      B = 9 
                      C = 5 
                      yes 
                      ?- applylist([=(A,5),is(B,+(4,5)),C is max(9,2),A=C]). 
                      no

*/
