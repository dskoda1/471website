#!/usr/bin/python  
# Used by unix/linux to excute this file with python
# to execute at the prompt in linux/unix
#  1- change file mode to execute permission
#      > chmod 0700 <filename>.py
#  2- to execute type file name (You may need to give path also)
#     > ./<filename>.py


print 'Eileen Head'
import os

# os.chdir('./Courses/471/HW/1Experments')
print 'Current directory:: '+os.getcwd() +'\nFiles: '
print os.listdir(os.getcwd())

file=open('rss.xml')
text=file.read()

lines = text.split('\n')
i = 1

#prints out each 100th line
print '4> Every 100th line'
for line in lines:
    if (i%99)==0:
        print repr(i) + line
    i=i+1

i = 0

import re
pat = re.compile(r""".*<title>""")
print '5> (r""".*<title>""")'
for line in lines:
    if pat.match(line):
            print repr(i)+':  '+ line  #repr() like toString
    i=i+1

i=0
pat = re.compile(r""".*<title>.*(?=.*</title>)""")  #r means raw string
print '6> Pattern matching one line at a time (r""".*<title>.*(?=.*</title>)""")'
for line in lines:
    if pat.match(line):
        print repr(i)+':  '+ line
    i=i+1

#lookahead without delimiting a group

print '7> lookahead without delimiting a group'
pat = re.compile(r"""<title>.*(?=</title>)""")
x=pat.search(text)
print x.group(0)

#lookahead and delimiting a group

print '8> lookahead and delimiting a group'
pat = re.compile(r"""<title>.*?(?:</title>)""")
x=pat.search(text)
print x.group(0)


#greedy
print '9> Greedy  re.compile(r"""<title>.*(?:</title>)""",re.DOTALL) '
pat = re.compile(r"""<title>.*(?:</title>)""",re.DOTALL)
x=pat.search(text)
# print x.group(0)  #Will print everything from first <title> until last </title>

#groups text into 3 groups, determined by use of "()"
print '10> groups text into 3 groups, determined by use of "()" '
print '   re.compile(r"""(<title>)(.*)(?:</title>)""",re.DOTALL)'

pat = re.compile(r"""(<title>)(.*)(?:</title>)""",re.DOTALL)
x=pat.search(text)
print x.group(1)

#NON-Greedy uses "?"
print
print '11> NON-Greedy uses "?" : re.compile(r"""(<title>)(.*?)(?:</title>)""",re.DOTALL)'

pat = re.compile(r"""(<title>)(.*?)(?:</title>)""",re.DOTALL)
x=pat.search(text)
print 'group(1) '+x.group(1)

print '12> NON-Greedy uses "?" : re.compile(r"""(?:<title>)(.*?)(?=</title>)""",re.DOTALL)'
pat = re.compile(r"""(?:<title>)(.*?)(?=</title>)""",re.DOTALL)
x=pat.search(text)
print x.group(1)  #??no group(2)
print 'groups() .......'
print x.groups()

# ?:  do not include in output,   NON greedy pattern matching (.*?)
print '13> another non-greedy pattern'
pat = re.compile(r"""(?:<title>)(.*?)(?:</title>)""",re.DOTALL)
xs=pat.findall(text)
# print xs              #x is a list of "title" strings


# print each title, one/line.  Quote around the title is caused by repr()

print '13.a> Titles only:'
i = 0
for x in xs:
    print repr(i)+': '+ repr(x)
    i=i+1


# print the location of the pattern in the "string"
print 'finditer: positions in string'
xs=pat.finditer(text)
for x in xs:
    print x.span()



#getting the stuff between <item...> tag including the attribute.

print '14>  item tags (3 patterns) '
pat = re.compile(r"""(?=(<item[^s].*?>))(.*?)(?:</item>)""",re.DOTALL)
xs=pat.search(text)
print xs.groups()  #3 patterns


#getting just the stuff between the tags

print '15> item tags: re.compile(r"""(?:<item[^s].*?>)(.*?)(?:</item>)""",re.DOTALL '
pat = re.compile(r"""(?:<item[^s].*?>)(.*?)(?:</item>)""",re.DOTALL)
xs=pat.search(text)
print xs.groups()
xs.group(0)  #whole match including item tag
print xs.group(1)  #stuff in between



