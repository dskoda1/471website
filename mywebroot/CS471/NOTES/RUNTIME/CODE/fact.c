int n; 
int fact(void) { 
  int loc; 
  if (n>1) { 
    loc = n--; 
    return loc * fact(); 
  }  else  { 
    return 1;
  }
} 
int main(void) { 
  n=3;
    if (n>0) 
      fact(); 
} 
