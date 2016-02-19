#include <stdio.h>
# done by S Rostedt
main ()
{
 int i, cond1, cond2, cond3, cond4, cond4a, cond5, 
cond6;

  /* loop i = 1, 5, 12, 10 to 1 step -1, 3, 6 to 10000 
            step i*i */

  /* this is 6 different conditions */

  for (i = 1, /* first condition */
        /* initialize condition flags */
        cond1 = cond2 = cond3 = cond4 = cond4a 
        = cond5 = cond6 = 1;

    /* Condition statements. */
    
    /* condition 1 to 3 with force pass */
    (cond1 && ((cond1 = 0) || 1)) ||  /* i = 1 */
    (cond2 && ((cond2 = 0) || 1)) ||  /* i = 5 */
    (cond3 && ((cond3 = 0) || 1)) ||  /* i = 12 */

    /* condition 4 has two parts. */
    /*  An initializer (i = 10) */
    /*  and an iterate (i = 9 to 1) */
    (cond4 && ((cond4 = 0) || 1)) ||
    (cond4a && ((cond4a = (i > 1)) || 1)) ||

    /* condition 5 with force pass */
    (cond5 && ((cond5 = 0) || 1)) ||  /* i = 3 */

    /* condition 6 with two parts */
    (cond6 && ((cond6 = 0) || 1)) ||  /* i = 6 */
    (i < 10000) ;                    /* i = i * i < 10000 */

    /* increments for i */
    i = cond2 ? 5 :
        cond3 ? 12 :
        cond4 ? 10 :
        cond4a ? i - 1:
        cond5 ? 3 :
        cond6 ? 6 : i*i
  ) {
    printf ("i = %d\n",i);
  } /* endfor */
}

   

