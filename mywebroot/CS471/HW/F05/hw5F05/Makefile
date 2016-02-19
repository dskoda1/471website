PROJECT=	hw6
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS= 	-ansi -Wall -o hw5F05.exe

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -ansi -o hw5DB.exe

# No libraries are used.
# Example for libs:   -L$$HOME/cs452/projects/prj5/lib -lcs452
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   hw5F05.c
# No header files used in this code.
H_SRC_FILES=

# Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile \
  README \
  hw5F05.html
# Intermediate files
O_FILES= \
   hw5F05.o


# Targets for compilation:
hw5F05: 	hw5F05.c
		$(CC) -o hw5F05 -ansi hw5F05.c

# Build executable to work with DEbugger.
hw5DB:  	hw5F05.c
		$(CC) -g -Wall hw5F05.c -o hw5DB


# Builds the intermedate assembly file for this program.
hw5ASM:  	hw5F05.c
		$(CC)  -Wall hw5F05.c -S -ansi -o hw5ASM.s


# Builds the intermedate assembly file with "debugger hooks" for this program. 
hw5ASMDB:  	hw5F05.c
		$(CC)  -Wall hw5F05.c -S -g -ansi -o hw5ASMDB.s

# Targets for executing:
runDB:  	hw5DB
		gdb ./hw5DB

# Visual Debugger that should work on the Sun and linux platforms
runSunDB:  	hw5DB
		ddd ./hw5DB

runIt:  	hw5F05
		./hw5F05

# Target for cleaning up files 
clear:  
		rm hw5DB
		rm hw5F05
		rm hw5*.o
		rm hw5*.s












