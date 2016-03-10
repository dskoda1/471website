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
		$(CC) -g -Wall factR.c -o factRD

factRDO: 	factR.c
		$(CC) -g -Wall -O factR.c -o factRDO



# Targets for executing:
runDB:  	factRD
		gdb ./factRD

# Visual Debugger that should work on the Sun and linux platforms.
runDDD:  	factRD
		ddd ./factRD

runDDDO:  factRDO
		ddd ./factRDO

# Create the Ass. code using default and optimizing compiler.
assFact:	factR.c
		$(CC)  -Wall factR.c -S  -ansi -o factRS.s	
			

assFactO:	factR.c 
		$(CC)  -Wall factR.c -S -O  -ansi -o factRSo.s


clear:  	rm factRD
		rm factRDO
		rm *.o	
