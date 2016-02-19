PROJECT=	GenericProgramming

CC=	g++
CFLAGS=	-g -Wall 


# -I$$HOME/cs471/projects/prj/lib


LIBS=	

#example for libs	-L$$HOME/cs471/projects/prj/lib -lcs471

CPP_SRC_FILES= \
 Book.cpp BookCompany.cpp program.cpp

H_SRC_FILES= \
 Book.h BookCompany.h 

SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile README

O_FILES= \
  program.o BookCompany.o Book.o

BookCompany.o:	BookCompany.h BookCompany.cpp Book.h Book.cpp 
	$(CC) $(CFLAGS)  -c BookCompany.cpp -o $@

Book.o:	Book.h Book.cpp
	$(CC) $(CFLAGS)  -c Book.cpp -o $@

program.o:	program.cpp BookCompany.h
	$(CC) $(CFLAGS)  -c program.cpp -o $@

TARGET=	BookCompany

$(TARGET):	$(O_FILES)
	$(CC) $(O_FILES) $(LIBS) -o $@

# You can run the code by ...> ./bookCompany.exe

clear:	rm *.exe
	rm *.o








