
sub outer($) {

	$subA = sub {
		print "subA: $lex, $dyn \n";
	};
	my $lex = $_[0]+99; #implicit parameter static local
	local $dyn = $_[0]; #implicit parameter dynamic local
	$subB = sub {
		print "subB: $lex, $dyn \n";
	};
	print "Outer: $lex, $dyn \n";
	$subA->();
	$subB->();
}
$lex = 1; $dyn = 1;   #globial
print "Main: $lex, $dyn \n";
outer(55);
print "Main: $lex, $dyn \n";

#Main: 1, 1 
#Outer: 55, 55 
#subA: 1, 55 
#subB: 55, 55 
#Main: 1, 1 
