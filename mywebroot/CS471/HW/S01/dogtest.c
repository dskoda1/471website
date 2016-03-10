//perfect example of how not to code
//        here are several examples of c's namespaces
//        I didn't believe head here so so we coded it up
//        and sure as shooting it worked.  
//        notice the first enum  the tag and typedef are the same
//        and legal
//        in the second enum the enum type name is the same as 
//        one of the enumeration constants and is legal
//        notice the stucture and function share the same name 
//        in several places.  Ouch.  Not that you should use 
//        any of this as it is bad programming style.  Why? you ask
//        because it decreases readability.  
//        Have fun with this one.   -Dogdaze(Ryon)
#include <stdio.h>

int funct(void)
{
  return 0;
}

typedef struct funct
{
  int funct;
} funct1;  //can't be funct if the above function is funct
           // can be otherwise

typedef enum j {a, b, c} j;
enum m {d, e, m};

int main(void)
{
  struct funct g;
  j k = a;
  int funct;
  enum m n;  

  n = m;
  

  printf("hey\n");  //was doing a compile test :)

  return 0;
}

