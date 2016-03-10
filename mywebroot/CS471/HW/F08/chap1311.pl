#!/usr/bin/perl 
# Problem 13.11 
# Run this code in Perl.
use diagnostics;
# reference
# http://www.computer-books.us/perl_0010.php
# $ is used to denote a scalar value.
sub foo {
	my $lex = $_[0];
	sub bar { 
  		print "$lex\n";
		$lex = 5;
	};
	print "Call to foo ";
	print "$lex\n";
	bar();
}
foo(2);

foo(3);
