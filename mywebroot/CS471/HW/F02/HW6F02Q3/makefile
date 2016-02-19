PROJECT=	hw6
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS= 	-ansi -Wall -o hw6F02.exe

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -ansi -o hw6DB.exe

# No libraries are used.
# Example for libs:   -L$$HOME/cs452/projects/prj5/lib -lcs452
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   hw6F02.c
# No header files used in this code.
H_SRC_FILES=

# Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile \
  README \
  hw6F02.html
# Intermediate files
O_FILES= \
   hw6F02.o


# Targets for compilation:
hw6F02: 	hw6F02.c
		$(CC) -o hw6F02 -ansi hw6F02.c

# Build executable to work with DEbugger.
hw6DB:  	hw6F02.c
		$(CC) -g -Wall hw6F02.c -o hw6DB


# Builds the intermedate assembly file for this program.
hw6ASM:  	hw6F02.c
		$(CC)  -Wall hw6F02.c -S -ansi -o hw6ASM.s


# Builds the intermedate assembly file with "debugger hooks" for this program. 
hw6ASMDB:  	hw6F02.c
		$(CC)  -Wall hw6F02.c -S -g -ansi -o hw6ASMDB.s

# Targets for executing:
runDB:  	hw6DB
		gdb ./hw6DB

# Visual Debugger that should work on the Sun and linux platforms
runSunDB:  	hw6DB
		ddd ./hw6DB

runIt:  	hw6F02
		./hw6F02

# Target for cleaning up files 
clear:  
		rm hw6DB
		rm hw6F02
		rm hw6*.o
		rm hw6*.s












