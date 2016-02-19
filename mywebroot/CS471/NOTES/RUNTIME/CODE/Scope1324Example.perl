#! /usr/bin/perl

sub outer($) {

	$subA = sub {
		print "subA: $lex, $dyn \n";
	};
	my $lex = $_[0]+99; # $_[0] is an implicit parameter static local
	local $dyn = $_[0]; #$_[0] is an implicit parameter dynamic local
	$subB = sub {
	   $bvar = "bvar -- see I am global"; #first occurrence of bvar
		print "subB: $lex, $dyn \n";  
	};
	print "Outer: $lex, $dyn \n";
	$subA->();
	$subB->();
}

$lex = 1; $dyn = 1;   # global
print "Main: $lex, $dyn \n";
outer(55);
print "Main: $lex, $dyn, bvar: $bvar \n";

