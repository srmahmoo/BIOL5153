#!/usr/bin/perl

$sequencename='randomsequence';
$sequence= 'ACTGGTCA';
$start='0';
$end='4';
$strand='fwd';

#output substring in fasta format
$result=substr($sequence,$start,"$end-$start");
print "\>$sequencename\_$start\_$end\_$strand\n$result\n";

#calculate and print reverse complement if required
$revcom= $result;
$revcom=~tr/ACGTacgt/TGCAtgca/;
print "$revcom\n";
exit
