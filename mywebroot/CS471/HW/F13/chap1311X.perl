#!/usr/bin/perl 
# Problem 13.11 

# Run this code in Perl.
# Rerun using--> use diagnostics; (remove "#" on the next line)

use diagnostics;

# reference
# http://www.computer-books.us/perl_0010.php


# $ is used to denote a scalar value.
# $_[0]  --- is the first parameter

sub foo {
	my $lex = $_[0];
	sub bar { 
  		print "$lex\n";
		$lex = $lex + 1;
	};
	print "Call to foo ";
	print "$lex\n";
	bar();
}

sub foohoo {

	my $lex = $_[0];
	$barvar = sub { 
  		print "$lex\n";
		$lex = $lex + 1;
	};
	print "Call to foohoo ";
	print "$lex\n";
	&$barvar();
}

foo(2);
foo(3);
foo(5);
foohoo(2);
foohoo(3);
foohoo(5);
