PROJECT=	GenericProgramming

CC=	gcc
CFLAGS=	-g -Wall 


# -I$$HOME/cs471/projects/prj/lib


LIBS=	

#example for libs	-L$$HOME/cs471/projects/prj/lib -lcs471

C_SRC_FILES= \
 book.c, bookCompany.c

H_SRC_FILES= \
 book.h

SRC_FILES= \
  $(C_SRC_FILES) \
  $(H_SRC_FILES) \
  Makefile README

O_FILES= \
  bookCompany.o book.o

bookCompany.o:	bookCompany.c book.h book.c
	$(CC) $(CFLAGS)  -c bookCompany.c -o $@

book.o:	book.h book.c
	$(CC) $(CFLAGS)  -c book.c -o $@

TARGET=	bookCompany

$(TARGET):	$(O_FILES)
	$(CC) $(O_FILES) $(LIBS) -o $@

# You can run the code by ...> ./bookCompany.exe

clear:	rm *.exe
	rm *.o








