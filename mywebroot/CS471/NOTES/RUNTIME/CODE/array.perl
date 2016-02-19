#!/usr/bin/env perl

@colors = ("red", "blue", "green");
foreach $i (@colors) {
    print "  $i\n";
}

print "End of foreach $i (@colors)\n";
print 'End of foreach $i (@colors) ---';
print "\n";


$colors[20] = "black";
$colors[15] = "white";
$colors[10] = "yellows";


foreach $i (@colors) {
    print "   $i\n";
}

