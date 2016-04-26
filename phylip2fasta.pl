#!/usr/bin/perl

#open filehandle
$filename="atp1\.phy";
open (FASTA,$filename) || die "Cant open $filename: $!\n";

#convert phylip to fasta
while ($line=<FASTA>){if ($line =~/\d/){} elsif ($line =~/ +/){$seq="$seq\>$line";}else{$seq="$seq$line";}}
$seq=~s/ +/\n/g;
$seq=~s/-//g;

#export to file
open atp1,">fastaatp1.fasta";
print atp1 "$seq";
close atp1;
exit


