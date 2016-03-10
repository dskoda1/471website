PROJECT=	hw1
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS= 	-ansi -Wall -o hw1p1.exe

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -std=c99 -o hw1DB.exe

# No libraries are used.
# Example for libs:   -L$$HOME/cs452/projects/prj5/lib -lcs452
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   hw1_1.c \
   hw1_1D.c
# No header files used in this code.
H_SRC_FILES= \
	hw1_1.h

# Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile \
  README 
# Intermediate files
O_FILES= \
   hw1_1.o \
	hw1_1D.o

# Target for creating an executable file:
hw1p1:		$(C_SRC_FILES) $(H_SRC_FILES)
		$(CC) -o hw1p1 -std=c99 $(C_SRC_FILES)

# Target for executing the program in problem 1.
runIt:  	hw1p1
		./hw1p1
		
# Builds the intermedate assembly file for hw1_1EH.c Use for problem 7

hw1p7ASM:  	hw1_1EH.c
		$(CC)  -Wall hw1_1EH.c -S -std=c99 -o hw1p7.s

# Target for cleaning up files 
clear:  
		rm hw1p1
		rm hw1*.o
		rm hw1*.s
