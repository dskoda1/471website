PROJECT=	prj5

CC=		gcc
CFLAGS=		-g -Wall 


LIBS=	

#example for libs	-L$$HOME/cs452/projects/prj5/lib -lcs452

C_SRC_FILES= \
  factR.c\
  factT.c
 

H_SRC_FILES=

SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile 

O_FILES= \
  factR.o

factRD: 	factR.c
		$(CC) -g -Wall  -std=iso9899:1999 factR.c -o factRD

factRDO: 	factR.c
		$(CC) -g -Wall  -std=iso9899:1999 factR.c -o factRDO -O3


# Targets for executing:
runDB:  	factRD
		gdb ./factRD

# Visual Debugger that should work on the Sun and linux platforms.
runDDD:  	factRD
		ddd ./factRD &

runDDDO:  factRDO
		ddd ./factRDO &

# Create the Ass. code using default and optimizing compiler.
assFact:	factR.c
		$(CC)  -Wall factR.c -S  -std=iso9899:1999 -o factRS.s	

assFactO1:	factR.c 
		$(CC)  -Wall factR.c -S  -std=iso9899:1999 -o factRS1.s -O1


assFactO2:	factR.c 
		$(CC)  -Wall factR.c -S  -std=iso9899:1999 -o factRS2.s -O2


assFactO3:	factR.c 
		$(CC)  -Wall factR.c -S  -std=iso9899:1999 -o factRS3.s -O3

clear:	rm factRD
			rm factRDO
			rm *.o	
