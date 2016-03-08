#Website renovation directory for 471

###To run first pass at dynamic route loading

cd mywebroot

python3 -m http.server

and navigate to

http://localhost:3000/#

Anything after the #is a relative path within /mywebroot, and appends .html to the path!



sed -i 's/old/new/g' filename

###Some uses of find that have resulted in positive results:
####Using grep:

grep -r <search phrase> .

Returns all files and subfiles that contain the search phrase

####Some situations that we need:
grep -r href=\"../../%7Ehead/ .
sed -i .bk 's/href="..\/..\/%7Ehead/href="\/#/g' <filename>

egrep -RZ 'href=\"..\/..\/%7Ehead' . | xargs -0 -l sed -i .bk -e 's/href="..\/..\/%7Ehead/href="\/#/g'

grep -r target=\"_blank .
sed -i .bk 's/target="_blank"//g' <filename>

grep -r href=\"http://bingweb.binghamton.edu/%7Ehead/ .
sed -i .bk 's/href="http:\/\/bingweb.binghamton.edu\/%7Ehead/href="\/#/g' <filename>

Now just need to figure out how to do this recursively!


