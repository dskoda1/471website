/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */

/*  
   This assignment is not intended to be hard, however many students will need
   time to absorb how easy it really is.  Most of the problems need only one or 
   two lines of facts/rules. The maximum number of lines is at MOST 4 lines.
   
   Example of using help in Swipl.
   At the prompt type:
           ?- help(functor).
           ?- help(=..)
           ?- help(arg).
 */ 

/* 1: For each US coin (dollar, half, quarter, dime, nickel, penny) create a
      a fact with it's argument is an atom representing the name of the coin and
      it's second argument it's value in pennies.  There will be 6 lines of 
      prolog needed to represent each coin. 
      Below the comment is the prolog for dollar. You need to add the other coins.
*/

coin(dollar, 100).


/* 2: Write a predicate, value(Coin, Num, Amt), where Coin is the name,
      Num is the number of that coin and Amt is the total value 
     (the value of the coin (in pennies) times the number of coins. )
     You should use the facts created in question 1 as
      as subgoal to find the value in pennies of the coin.
        ?- value(quarter,5, Amt).
        Amt = 125
        ?- value(dime,10, 100).
        Yes
        ?- value(dime,N, 100).
        ERROR: is/2: Arguments are not sufficiently instantiated
 */




/* 3: point(X,Y) is the structure which represents a point.  Write a fact
     "origin" which succeeds if both X and Y are zero.  This is very easy.
    e.g. 
      ?- origin(P).
    succeeds if P is a point with x = 0 and y = 0.
 */



/* 4: Define a relation "inside(p,r)" which is true if and only if
     point p lies inside a circle or radius r.
     This relation can be defined as:
       inside(point(x,y),r) if and only if x^2 + y^2 < r^2 
 */



/* 5: The ternary relation "collinear(p1,p2,p3)", is true if and only if
      p1, p2, and p3 lie on a straight line.  One definition is as follows:
      collinear(point(x1,y1), point(x2,y2), point(x3, y3)) 
        if and only if
             (x1-x2)(y2-y3) equals (y1-y2)(x2-x3)        
      e.g.
      ?- collinear(point(1,1),point(2,2),point(3,3)).
      Yes
 */




/* 6: lastV(Lst,Last). succeeds if Last is the last element in Lst */



/*7: initV(Lst, InitOfLst) succeeds if InitOfLst is the same as Lst except the last
        element of Lst is missing. i.e. 
   ?- initV([a,b,c,d,e],Init). 
   Init = [a, b, c, d] Yes
 */



/* 8: nth(Num,Lst,Element) succeeds if the Numth element of the list
        Lst is Element.  The count starts with 0.
i.e.
     ?- nth(3,[a,b,c,d,e,f,g],E).
     E = d
     Yes
*/




/* 9: After you rewrite the "gcdR" C code to remove the "!=".  
      (with the same behavior),

          int gcdR(int a, int b) {
              if (a!=b) {
                if (a > b) {
                   return gcdR(a - b, b);
                } else {
                   return gcdR(a, b-a);
                }
              } else {
                return a;
              }
          }"
          
      translate your code to Prolog.
        
*/ 




/* 10: Ackermann's functions as defined in hw 1 question 8.
*/



/*11: Define the procedure 'zip' so that zip(Lst1,Lst2,Zipped) succeeds if
     Zipped is a list of sequences (tuples) . The first value of the sequence 
     is from the corresponding position from Lst1 and the second value is from 
     corresponding position from Lst2. Note: The length of Zipped will be the
     minimum of the length of Lst1 and length of Lst2. e.g.
           ?- zip([1,2,3,4],[a,b,c],Z).
           Z = [ (1, a), (2, b), (3, c)] 
           Yes
           ?- zip([a],[1,2,3,4],Z).
           Z = [ (a, 1)] 
           Yes
*/



