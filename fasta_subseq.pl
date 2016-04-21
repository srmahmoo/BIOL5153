#!/usr/bin/perl

print "Please enter filename in fasta format e.g. xyz.fasta\n"; 
$filename=<STDIN>;
chomp $filename;


open (FASTA,$filename) || die "Cant open $filename: $!\n";
while ($line=<FASTA>) {if($line =~/\A>/){$sequencename=$line;chomp $sequencename} else {chomp $line; $sequence=$sequence.$line;};};
close FASTA;




print "\Please enter start position for extraction \(1 or greater\)\n";
$start=<STDIN>;
chomp $start;
while($start=~m/\D/){print"Please enter numbers only\n";$start=<STDIN>;chomp $start;};
$start -=1;


print "Please enter end position for extraction\(must be greater than start position\)\n";
$end=<STDIN>;
chomp $end;
while($end=~m/\D/){print"Please enter numbers only\n";$end=<STDIN>;chomp $end;};
$end -=1;


print "Please enter strand feature\n";
$strand=<STDIN>;

#output substring in fasta format
$length=$end-$start+1;
$result=substr($sequence,$start,$length);
print "\n$sequencename\_$start\_$end\_$strand$result\n";

#calculate and print reverse complement if required
$revcom= $result;
$revcom=~tr/ACGTacgt/TGCAtgca/;
print "\nReverse Complement\n$revcom\n\n";
exit
