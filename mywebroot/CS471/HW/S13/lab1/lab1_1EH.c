/* Use to generate assembly file */


int gcdI(int i, int j) {
    while ( i != j) { 
        if (i > j) {
           i = i - j;
        } else {
          j = j - i;
        }
    }      
    return i;
}
