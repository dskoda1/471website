import os

#os.chdir('./Courses/471/HW/1Experments')

print os.listdir(os.getcwd())
file = open('2005-May.txt')
text = file.read()
lines =text.split('\n')
import re
match = re.compile(
	r"""\b(!X|!>|!List)*""",
	re.VERBOSE)

