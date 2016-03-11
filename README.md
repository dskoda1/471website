#Website renovation directory for 471

###To run first pass at dynamic route loading

cd mywebroot

python3 -m http.server 8080

and navigate to

http://localhost:3000/# or

https://head-website-dskoda1.c9users.io:8081/#/

Anything after the #is a relative path within /mywebroot. need .html in file name



sed -i 's/old/new/g' filename

###Some uses of find that have resulted in positive results:
####Using grep:

grep -r <search phrase> .

Returns all files and subfiles that contain the search phrase

####Some situations that we need:
grep -r href=\"../../%7Ehead/ .
find . -name "*.html" -print0 | xargs -0 sed -i '' -e 's/href="..\/..\/%7Ehead/href="\/#/g'


grep -r target=\"_blank .
sed -i .bk 's/target="_blank"//g' <filename>

grep -r href=\"http://bingweb.binghamton.edu/%7Ehead/ .
find . -name "*.html" -print0 | xargs -0 sed -i'' -e 's/href="http:\/\/bingweb.binghamton.edu\/%7Ehead/href="\/#/g'


More cases:
href="http://bingweb.binghamton.edu/~head/CS471/
href=\"http:\/\/bingweb.binghamton.edu\/~head\/CS471\/
find . -name "*.html" -print0 | xargs -0 sed -i'' -e 's/href="http:\/\/bingweb.binghamton.edu\/~head/href="\/#/g'




