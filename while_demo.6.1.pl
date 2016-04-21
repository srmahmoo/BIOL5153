#!/usr/bin/perl

print "Please enter initial count value\n"; 
$count = <STDIN>;
chomp $count;
while($count=~m/\D/){print"Please enter numbers only\n";$count=<STDIN>;chomp $count;};
print "Initial count value is $count. Please enter max count value\n";
$max=<STDIN>; 
chomp $max;
while($max=~m/\D/){print"Please enter numbers only\n";$max=<STDIN>; chomp $max;} 

$sum = 0;
$increment='1';

while( $count < $max ){
  print $count, "\n";
  $sum += $count;
  $count = $count + $increment;
}

print "The final count: $count\n";
print "The sum total was: $sum\n";

exit;


