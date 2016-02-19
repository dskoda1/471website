> module Complex where

++++++++++++++++++++++++++++++
Build a new type 
        Complex a b
   that is a type in the Num Class.  
   We use "deriving Show, EQ, Read" to implement show,==,/=.

If complex numbers can represented as the set of all ordered pairs (a,b) 
of real numbers then

   1) Addition and multiplication defined by:
      (a,b) + (c,d) = (a+c, b+d)
      (a,b) * (c,d) = (ac - bd, ad + bc)

   2) A real number a is represented by (a,0).

   3) The absolute value can defined by:
      abs(a,b) = (sqrt(a^2 + b^2),0)   
   4) magnitude (a,b) = sqrt(a^2 + b^2)

    We will define signum(a,b)  to be the  
      (a/magnitude(a,b),b/magitude(a,b))
    
    We will define negate (a,b) to be (negate a, negate b)
   
    Use common sense to define fromInteger, fromInt.
For Example:

  Complex> (Complex 3.2 4.1) * fromInteger 5
  Complex 16.0 20.5
  Complex> (Complex 3.2 4.1) + (Complex (-4.2) 0.9)
  Complex (-1.0) 5.0
  Complex> (Complex 3.2 4.1) - (Complex (-4.2) 0.9)
  Complex 7.4 3.2
  Complex> (Complex 3.2 4.1) * (Complex (-4.2) 0.9)
  Complex (-17.13) (-14.34)
  Complex>  negate (Complex (-4.2) 0.9)
  Complex 4.2 (-0.9)
  Complex>  signum (Complex (-4.2) 0.9)
  Complex (-0.977802414077409) 0.209529088730873
  Complex>  signum (Complex (4.2) 0.9)
  Complex 0.977802414077409 0.209529088730873
  Complex> signum (Complex 0 0.9)
  Complex 0.0 1.0
  Complex>  signum (Complex 0 0)
  Complex 0.0 0.0
  Complex> (Complex 3.2 4.1) * fromInteger 5
  Complex 16.0 20.5
  Complex> (Complex 3.2 4.1) + fromInteger 5
  Complex 8.2 4.1
  Complex>


I have implemented the data type and started the definition for implementing
the functions required to be in the class Num.

++++++++++++++++++++++++++++++++++++++++

> data (RealFloat a)=> Complex a =  Complex a a 
>	               deriving (Eq,Read,Show)

> instance (RealFloat a) => Num (Complex a)  
>     where
>     (+) (Complex a b)  (Complex a' b') = Complex (a+a') (b+b')
>     (-)  ...









