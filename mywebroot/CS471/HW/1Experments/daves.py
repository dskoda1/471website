#!/usr/bin/python  
# Used by unix/linux to excute this file with python
# to execute at the prompt in linux/unix
#  1- change file mode to execute permission
#      > chmod 0700 daves.py
#  2- to execute type file name (You may need to give path also)
#     > ./daves.py

# From "Learning Python 2ed" page 448

import re
matchstr = re.compile(
    r"""\b(red|green)       #'red' or 'green' starting
                            # first r: raw string suppresses escapes (p78)
        (\s+                   # followed by whilespace
        pepper                 # The word pepper
        (?!corn)               # if not followed immediately by 'corn'
        (?=.*salad))""",       # and if followed at some point by 'salad'
    re.IGNORECASE |            # NOT CASE SENATIVE
    re.DOTALL |                # aLLOW DOT TO MATCH NEWLINES AS WELL
    re.VERBOSE)                # THIS ALLOWS COMMENTS AND NEW LINES ABOVE.
file = open('pepper.txt')
text = file.read()
paragraphs = text.split('\n\n')
for paragraph in paragraphs:
    fixed = matchstr.sub('REPLACED STR',paragraph)
    print fixed+'\n'


#mail re

eFile = open('2005-May.txt')
matchEstr = re.compile(
    r"""(((^List-)|(^X-)|(^>)).*)""",
    re.VERBOSE)
msg = eFile.read()
lines = msg.split('\n')
for line in lines:
    
    out = matchEstr.sub('',line)
    print out



    
    
