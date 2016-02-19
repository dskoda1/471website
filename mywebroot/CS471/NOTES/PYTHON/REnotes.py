#!/usr/bin/python  
# Used by unix/linux to excute this file with python
# to execute at the prompt in linux/unix
#  1- change file mode to execute permission
#      > chmod 0700 <filename>.py
#  2- to execute type file name (You may need to give path also)
#     > ./<filename>.py
# reference (Howto Regular expressions): http://www.amk.ca/python/howto/regex/
#   (This reference is also available from the help pull down menu in either
#        shell window or edit window.)
# Example modified from Programming Python page 1045-47
# Code Model for using regular expression to extra information
# Purpose: To learn to program Python by example
#          To see how Python's Regular Expression Module can be used

# 1a: Simple print out
print
print 'Example by Eileen Head'
# Can use either ' or " to delimit literal strings

# 2a: Example code for listing all files in current directory

import os

# 3a: Command to change directory
# os.chdir('./Courses/471/HW/1Experments')

# Print the file names in current directory.
print os.listdir(os.getcwd())

# 4a:Open file and read data into a string object referred to by 'text'
file = open('2005-May.txt')
text = file.read()

# collect string into lines of data terminated by '\n'
lines =text.split('\n')

# simple printout of every 99th line with line number 
# repr(object) a string containing a printable representation of an object.
i = 0
for line in lines:
    i = i+1
    if (i%99)==0: print repr(i) +': ' + line

################################################
# 1b:Working with regular expressions

import re

patStr = "A.C."
strg = "xxxABCDxxx"

# 2b: compile a regular expression to use on the data string
patObj = re.compile(patStr)

# 3b: One difference between match and search
resultObj = patObj.search(strg) # returns match object or 'None'
                               # 'None' is treated as false in a conditional                              
if resultObj:
    print "search"
    print resultObj.start() # start is the index where matched
   
resultObj =patObj.match(strg)
if resultObj:
    print "match"
    print resultObj.start() # start is the index where matched


patStr =".*A.*C.*"
patObj = re.compile(patStr)
resultObj   = patObj.search(strg) # returns match object or 'None'
                               # 'None' is treated as false in a conditional                              
if resultObj:
    print "search"
    print resultObj.start() # start is the index where matched
   
resultObj =patObj.match(strg)

if resultObj:
    print "match"
    print resultObj.start() # start is the index where matched


# 4b: Instead of compiling the re pattern you can pass it directly to the function
print "selection set"
print re.search(" *A.C[DE][D-F][^G-ZE]G\t+ ?", "..ABCDEFG\t..").start()

print "alternatives"
print re.search("A|XB|YC|ZD", "...AYCD..").start()

print "word boundary"

print "pattern begins with word boundary "+ repr(re.search(r"\bABCD", "..ABCD  ").start())
print "pattern ends with word boundary "+ repr(re.search(r"ABCD\b", "..ABCD  ").start())

# 5b: groups allow a way to captures substrings recognized by RE
# parentheses delimit groups


patStr = "A(.)B(.)C(.)"   # saves 3 substrings
patObj = re.compile(patStr)

resultObj = patObj.match("A0B1C2")  # search begins at first character
print "Extracting substrings"
print resultObj.groups()   # print all subgroups
print resultObj.group(1)   # print the first group
print resultObj.group(2), resultObj.group(3) # print the next two groups
print resultObj.group(0)   # The complete recognized string

patStr = "(A|X)(B|Y)(C|Z)D"
patObj = re.compile(patStr)

resultObj = patObj.search("...AYCDXYZ...ABCD...")  # search finds the first occurence
print resultObj.groups()   # print all subgroups
print resultObj.group(1), resultObj.group(2), resultObj.group(3) # print the subgroups
print resultObj.group(0)   # The complete recognized string

############################################################
# 1c: Combining RE and working with text files
# file, text and line are defined in Part a.

# Recognize all lines that begin with List

# VERBOSE flag:
#  This flag allows you to write regular expressions that look nicer.
#  Whitespace within the pattern is ignored, except when in a character class
#  or preceded by an unescaped backslash, and, when a line contains a "#"
#  neither in a character class or preceded by an unescaped backslash,
#  all characters from the leftmost such "#" through the end of the line
#  are ignored.

# r means raw string.  It allows one to use the "\"
# Print out all input lines that begin with "List-Help"
patObj = re.compile(
	r"""List-Help""",
	re.VERBOSE)


i = 0
for line in lines:
    i = i+1
    resultObj = patObj.match(line)
    if resultObj: print repr(i) +': ' + line

# Print out all email address that use 3 characters for top level domain name.
patStr = r"""<(.*?@.*?\....)>"""  # "\" is an escape character.
                        # "*" greedly consumes as much as possible
                        # use of "?" after * makes *? a non-greedly qualifier
                        # Other uses of "?"
                        # use of R? means 0 or 1 occurence of the regular expression R
                        # (?=R) Allows lookaheads.
                        #    For example X(?=Y) matches X only if Y follows
                        # This pattern works without the non-greedly qualifier
patObj = re.compile(patStr)

i = 0
for line in lines:  # need the ":"
    i = i+1
    resultObj = patObj.search(line)
    if resultObj:  
        print repr(i) +'$ '+ resultObj.group(1)

# Print out all email address that use 2 characters for top level domain name.
patStr = r"""<(.*?@.*?\...)>"""  
patObj = re.compile(patStr)

i = 0
for line in lines:  # need the ":"
    i = i+1
    resultObj = patObj.search(line)
    if resultObj:  

        print repr(i) +'$ '+ resultObj.group(1)


print "Mail addresses that appear with the mailto: attribute"
patStr = r"""<.*:(.*?@.*\....)(>|[?].*>)"""  
patObj = re.compile(patStr)

i = 0
for line in lines:  # need the ":"
    i = i+1
    resultObj = patObj.search(line)
    if resultObj:  
        print repr(i) +" "+ resultObj.group(1)
    

print "Mail addresses that appear with the mailto: attribute and Subject = Help"
patStr = r"""<.*:(.*?@.*\....)[?]subject=help>"""  
patObj = re.compile(patStr)

i = 0
for line in lines:  # need the ":"
    i = i+1
    resultObj = patObj.search(line)
    if resultObj:  
        print repr(i)+ resultObj.group(1)

print 
print "Mail addresses that appear in a line that begins with 'from' and has 'May'"
# \s means match any whitespace.
patStr = r"""From (.*?@.*\....)\s(?=....May)"""  
patObj = re.compile(patStr)

i = 0
for line in lines:  # need the ":"
    i = i+1
    resultObj = patObj.search(line)
    if resultObj:  
        print repr(i)+ resultObj.group(1)

