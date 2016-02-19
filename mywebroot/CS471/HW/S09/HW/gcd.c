/* Compile the code, p8.c, on a  Intel platform twice as follows:
                   gcc gcd.c -S -std=iso9899:1999
                  

*/

int a;
int b;
int gcd() {
    while (a != b) {
        if (a > b) {
          a = a - b;
        } else {
         b = b - a;
       }
    } 
    return a;
}


