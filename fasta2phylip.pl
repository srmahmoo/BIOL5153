#!/usr/bin/perl

$maxl=25;
$seql=0;
$filename="atp1.fas";
open (FASTA,$filename) || die "Cant open $filename: $!\n";
while ($line=<FASTA>) {if($line =~/\A>/){$sequence=$sequence.$line;}else{$sequence=$sequence.$line;chomp $sequence;}}

@phylip=split/>/,$sequence;
shift@phylip;

foreach $phylip(@phylip){$phylip=~/(^.*\n)/;$l=$maxl-length($&);$space=" "x$l;push @final, "$&$space$'";if($seql<length($')){$seql=length($')}}
$output=scalar @final."\t$seql\n";
foreach $final(@final){$final=~s/\n//g;$output="$output$final\n";}

open atp1,">phylipatp1.phy";
print atp1 "$output";
close atp1;
exit


