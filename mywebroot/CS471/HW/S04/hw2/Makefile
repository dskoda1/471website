PROJECT=	Fig4_12
# The compiler we are using is gcc 
CC=		gcc
# The Flags will print compiler warnings and will compile the code according to 
# Ansi standards. 
CFLAGS= 	-ansi -Wall -o Fig4_12.exe

# Using the -g will allow the code to be run in the debugger.
DBUGFLAGS=	-g -Wall -ansi -o Fig4_12DB.exe

# No libraries are used.
# Example for libs:   -L$$HOME/cs452/projects/prj5/lib -lcs452
LIBS=	

# Allows us to use variables for file names.
C_SRC_FILES= \
   Fig4_12.c
# No header files used in this code.
H_SRC_FILES=

# Files for this assignment
SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile 

# Intermediate files
O_FILES= \
   Fig4_12.o


# Targets for compilation:
Fig4_12: 	Fig4_12.c
		$(CC) -o Fig4_12 -ansi Fig4_12.c

# Build executable to work with DEbugger.
Fig4_12DB:  	Fig4_12.c
		$(CC) -g -Wall Fig4_12.c -o Fig4_12DB
# Builds the intermedate assembly file for this program.
Fig4_12ASM:  	Fig4_12.c
		$(CC)  -Wall Fig4_12.c -S -ansi -o Fig4_12ASM.s


# Builds the intermedate assembly file with "debugger hooks" for this program. 
Fig4_12ASMDB:  	Fig4_12.c
		$(CC)  -Wall Fig4_12.c -S -g -ansi -o Fig4_12ASMDB.s

# Targets for executing:
runDB:  	Fig4_12DB
		gdb ./Fig4_12DB

# Visual Debugger that should work on the Sun and linux platforms
runSunDB:  	Fig4_12DB
		ddd ./Fig4_12DB

runIt:  	Fig4_12
		./Fig4_12

# Target for cleaning up files 
clear:  
		rm FigDB
		rm Fig4_12
		rm Fig4_12*.o
		rm Fig4_12*.s

