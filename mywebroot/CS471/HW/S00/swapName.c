#include <stdio.h>
#include <string.h>

void *
chgName(char * name1, char *name2)
{
   char * string;
   
   strcpy(string, name1);
   strcpy(name1, name2);
   strcpy(name2, string);
   return;
}

int 
main(int argc, char **argv)
{


   fprintf(stdout, "name1: %s, argv[1]: %s, argv[2]: %s\n", argv[1], argv[2]);
   chgName(argv[1], argv[2]);
   fprintf(stdout, "name1: %s, argv[1]: %s, argv[2]: %s\n", argv[1], argv[2]);

   exit(0);
}
