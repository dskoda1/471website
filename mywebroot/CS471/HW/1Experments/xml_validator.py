# Can use either ' or " to delimit literal strings
import os
import re
import string
import pdb


class Validator:

   xmlStr = "^<\s*\?xml\s*version.*?>"
   tagStr = "<.*?>"
   commentStr = "<!+.*?>"
   matchStr = ".*"
   starttag = "<[^/].*[^/]>"
   endtag = "<[/].*[^/]>"
   selfendtag = "<[^/].*[/]>"
   #following lien says the str does not contain / either at the beginning or end of the str

   xmlpat = re.compile(tagStr, re.DOTALL)
   tagpat = re.compile(tagStr,re.DOTALL)
   commentpat = re.compile(commentStr,re.DOTALL)
   matchpat = re.compile(matchStr, re.DOTALL)
   cleanpat = re.compile(r'\W+')
   startpat = re.compile(starttag, re.DOTALL)
   endpat = re.compile(endtag, re.DOTALL)
   selfendpat = re.compile(selfendtag, re.DOTALL)
   tagstr = ''
   flag = 1
   def __init__(self, filename):
       r = self.process(filename)
       if r == 1:
       		print filename+" is a valid xml file"
       else:
       		print filename+" is not a valid xml file"

   # replace selected target with empty string that has the same length
   def remove(self, target, tup):
       s = tup[0]
       e = tup[1]
       i=s
       tmpstr = ""
       while i<e:
           tmpstr = tmpstr+" "
           i= i+1
       target = string.replace(target, target[tup[0]:tup[1]],tmpstr)
       return target

   # return the end tag that match the given target
   def find_end(self, target, targettext):
       # remove the part that is not part of the tag name
       #tmp = cleanpat.search(target)
       #pdb.set_trace()
       sl = string.split(target)
       name = sl[0]
       tmpStr = str(name[0])+'\/'+str(name[1:])
       pat = re.compile(tmpStr)
       match = pat.search(targettext)
       if match:
           return match
       else:
           print "error in find_end"
           return None

   # given a tag , check it's type: start tag, end tag, or self end tag
   def type_check(self, target):
       # first check whether it is a start tag
       sr = Validator.startpat.search(target)
       if sr:
           return 3
       else:
           # then check whether it is a self end tag
           ser = self.selfendpat.search(target)
           if ser:
               return 2
           else:
               # finally check whether it is an end tag
               er = self.endpat.search(target)
               if er:
                   return 1
               else:
                   print "Error in type_check."+target+" does not belong to any type."
                   return None

   # find the matching tag for each start tag in the file
   # the basic idea is to find matching tag, and then within the range search for other tag. If an end tag of a start tag in this range is out of the range, then nested tags found.
   def matching(self, target, targettext):
       
       endr = self.find_end(target, targettext)
       if endr:
           endpos = endr.span()
           print "endr.group()="+endr.group(0)
           return endpos
       else:
           print "No end tag can be found for tag "+target
           return None

	
   # main method
   def process(self, filename):
       # rangelist is a list of tuple of tuple. each element is a tuple which contains two tuples.
       # the first tuple is the range of the parent tage and the second is the range of itself
       rangelist = []
       counter = 0

       # Open file and read data into a string object referred to by 'text'
       file = open(filename)
       text = file.read()
       xmlstart = Validator.xmlpat.search(text)
       if xmlstart:
           tp = xmlstart.span()
           text = self.remove(text, tp)
       else:
           print "Invalid XML file. No version line can be found"
       # build a string full of tags which does not include comment tag the the start version tag
       iterator = Validator.tagpat.finditer(text)
       for it in iterator:
           itstr = it.group()
           tp = it.span()
           # if the current tag is a comment tag, ignore it
           if Validator.commentpat.search(itstr):
               continue
           Validator.tagstr = Validator.tagstr+itstr

       checkrange = (0,len(Validator.tagstr))
       # for each tag in the tagstr string
       iterator = Validator.tagpat.finditer(Validator.tagstr)
       while 1:
           if Validator.flag==-1:
               break
           it = Validator.tagpat.search(Validator.tagstr)
           if it == None:
               break
           #for it in iterator:
           tag = it.group(0)
           startpos = it.span()
           print "tag: "+tag
           #for each starting tag, check whether there is a matched end tag
           typ = self.type_check(tag)
           #if it is a start tag
           if typ == 3:
               endpos = self.matching(tag, Validator.tagstr)
               if endpos:
                   # if the current tag is within the range of the prev one, set the prev range as parent range
                   if startpos[0]<checkrange[1] and not endpos[1]>checkrange[1]:
                       parentrange = (checkrange[0], checkrange[1])
                       checkrange = (startpos[1], endpos[1])
                       # store it in the rangelist
                       rangelist.append((parentrange, checkrange))
                       Validator.tagstr = self.remove(Validator.tagstr, endpos)
                       Validator.tagstr = self.remove(Validator.tagstr, startpos)
                   elif startpos[0]<checkrange[1] and endpos[1]>checkrange[1]:
                       print "Nested tags detected. Invalid tag "+tag
                       Validator.flag = -1
                       return Validator.flag
                   elif startpos[0]>=checkrange[1] and endpos[1]>checkrange[1]:
                       i = len(rangelist)-1
                       # find the parent range for the current pair of tags
                       while i>0 or i==0:
                           # upper is the parent upper range of the prev tags
                           upper = rangelist[i][0][1]
                           if startpos[0] > upper:
                               i-=1
                           else:
                               if endpos[1] > upper:
                                   print "Nested tags detected. Invalide tag "+tag
                                   flag = -1
                                   return Validator.flag
                               else:
                                   checkrange = (startpos[0], endpos[1])
                                   rangelist.append((rangelist[i], checkrange))
                                   Validator.tagstr = self.remove(Validator.tagstr, endpos)
                                   Validator.tagstr = self.remove(Validator.tagstr, startpos)
                                   break

               else:
                   print "Invalid xml format. No matching end tag for "+tag
                   Validator.flag = -1
                   return Validator.flag
           # is an end tag
           elif typ == 1:
               print "Unmatched end tag "+tag
               Validator.flag = -1
               return Validator.flag
            # if an end tag occurs before any corresponding start tag, it's wrong
           else:
               #remove it from the text
               Validator.tagstr = self.remove(Validator.tagstr, startpos)
       return Validator.flag

if __name__=='__main__':
   filename = raw_input("Please enter the full path of a xml file: ")
   myvalidator = Validator(filename)
   if myvalidator.flag==1:
       filename+" has a valid form"
   else:
       filename+" has is invalid"

