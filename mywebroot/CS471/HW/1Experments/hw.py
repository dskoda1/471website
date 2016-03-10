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

file = open('rss.xml')
text = file.read()

# collect string into lines of data terminated by '\n'
lines =text.split('\n')

import re

pattern = r"""<([a-z:]+)\b.*?/>(.*)"""
reObj = re.compile(pattern)

i=0
for line in lines:
    i=i+1
    resultObj=reObj.search(line)
    
    if resultObj:
        print "GROUP 1 "+resultObj.group(1)
        print "GROUP 0 "+resultObj.group(0) 
        print repr(i) +'$ '+ line



    
