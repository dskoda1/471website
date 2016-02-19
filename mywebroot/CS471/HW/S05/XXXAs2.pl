/*
        CS471 - Programming Languages
        Section: <YOUR Section number>
        Assignment #<number> due: <DATE>
        Author: <LastName>, <FirstName> (<EMail>)
        Date: <DATE>
 */

/* Purpose:
 * to practice writing relations in Prolog
 * to practice letting Prolog solve queries 
 *            by writing just facts
 *            by writing clauses
 * to understand unification, the "is" predicate
 * to reenforce recursive programming
 * to reenforce the use of the list data structure in Prolog
 * to reenforce the difference between atoms and strings

   This assignment is not intended to be hard, however many will need
   time to absorb how easy it really is.  Most of the code need only be
   two lines and maximum number of lines is at MOST 3 lines.

 */

/* 1 Read exercise 3.1
    (http://www.coli.uni-sb.de/~kris/prolog-course/html/node30.html#sec.l3.exercises) 
   in Prolog now.
   Add an outer doll (first)  named , Oksana , and an inner doll (last) named, 
   Elina, to the nested dolls. Complete exercise 3.1 with 6 dolls. 
*/

%% Add two addtional facts to handle Oksana and Elina dolls.
%% directlyIn(X,Y): X is contained in Y

directlyIn(irina,natasha).
directlyIn(natasha,olga).
directlyIn(olga,katarina).

%% If you find the answer DON'T forget to credit the orginal author. 
%% in(X,Y): X is (directly or indirectly) contained in Y



/* 2. Define a predicate named, separated,  which succeeds if the first doll 
      named has exactly one inner doll between it and the second doll. i.e.
     ?- separated(elina,natasha).
     Yes
     ?- separated(natasha,elina).
     Yes
     ?- separated(natasha,olga).
     No
 */



/*3  Read exercise 3.2.  Define a predicate less_than/2 that takes two numerals 
     in the notation that we introduced in this lecture 
     (i.e. 0, succ(0), succ(succ(0)) ...) as arguments and decides whether 
     the first one is less than the second one. E.g:

    ?- less_than(succ(succ(succ(0))),succ(0)).
    no
    ?- less_than(succ(succ(0)),succ(succ(succ(0)))).
    yes

 */




/* 4. Practical programming problem 3.2
 We are given the following knowledge base of travel information:
*/

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
     
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
     
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

/* 4 continued:
   Write a predicate travel/2 which determines whether it is possible 
    to travel from one place to another by `chaining together' car, train, 
    and plane journeys. For example, your program should answer `yes' 
    to the query travel(valmont,raglan).
   
    Complete the code I have provided.  You will need to add 4 clauses.
*/

travel(X,Y):-byCar(X,Y).


travel(X,Y):-byCar(X,Z),travel(Z,Y).



/* 5 point(X,Y) is the structure which represents a point.  Write a fact
     "origin" which succeeds if both X and Y are zero.
    i.e. 
      ?- origin(P).
    succeeds if P is a point with x = 0 and y = 0.
 */



/* 6 Define a relation "outside(p,r)" which is true if and only if
     point p lies inside a circle or radius r.
     This relation can be defined as:
       outside(point(x,y),r) if and only if x^2 + y^2 > r^2 
 */



/* 7 The ternary relation "collinear(p1,p2,p3)", is true if and only if
      p1, p2, and p3 lie on a straight line.  One definition is as follows:
      collinear(point(x1,y1), point(x2,y2), point(x3, y3))
        if and only if
             (x1-x2)(y2-y3) equals (y1-y2)(x2-x3)
 */



/* 8: Practical programming problem 4.1-.3. Write the definitions for combine1, combine2 and combine3.

   1.Write a 3-place predicate combine1 which takes three lists as arguments and 
     combines the elements of the first two lists into the third as follows:

          ?- combine1([a,b,c],[1,2,3],X).
           
          X = [a,1,b,2,c,3]
           
          ?- combine1([foo,bar,yip,yup],[glub,glab,glib,glob],Result).
           
          Result = [foo,glub,bar,glab,yip,glib,yup,glob]

   2. Now write a 3-place predicate combine2 which takes three lists as arguments 
      and combines the elements of the first two lists into the third as follows:

          ?- combine2([a,b,c],[1,2,3],X).
           
          X = [[a,1],[b,2],[c,3]]
           
          ?- combine2([foo,bar,yip,yup],[glub,glab,glib,glob],Result).
           
          Result = [[foo,glub],[bar,glab],[yip,glib],[yup,glob]]

   3. Finally, write a 3-place predicate combine3 which takes three lists as 
      arguments and combines the elements of the first two lists into the third 
      as follows:

          ?- combine3([a,b,c],[1,2,3],X).
           
          X = [join(a,1),join(b,2),join(c,3)]
           
          ?- combine3([foo,bar,yip,yup],[glub,glab,glib,glob],R).
           
          R = [join(foo,glub),join(bar,glab),join(yip,glib),join(yup,glob)]

  All three programs are pretty much the same as a2b/2 (though of course they 
  manipulate three lists, not two). That is, all three can be written by recursing 
  down the lists, doing something to the heads, and then recursively doing the 
  same thing to the tails. Indeed, once you have written combine1, you just need 
  to change the `something' you do to the heads to get combine2 and combine3.
 */


/* 9: Program exercise 1.1 page 30 in prolog. i.e
       ?- numDigit(100,N).
*/



/* 10: Ackermann's functions as defined in written question 4.
*/




/* 11  Define a predicate, listOfFunctorss(ListOfArgs,Name, ListOfResults), 
     where each term in the ListOfResults is a term with one argument 
     from the ListOfResults and the functor name is the Name.
            Type "help" in Swipl
               help(functor).
               help(=..)
               help(arg).
            for information on the built-in predicates functor,=.., arg.

            ?- listOfFunctors([a,b,23,4],foo,T).
          T = [foo(a), foo(b), foo(23), foo(4)]
          Yes
 */

