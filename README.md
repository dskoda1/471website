#Website renovation directory for 471

###To run first pass at dynamic route loading

cd mywebroot

python3 -m http.server

and navigate to

http://localhost:3000/#

Anything after the #is a relative path within /mywebroot, and appends .html to the path!



sed -i 's/old/new/g' filename



