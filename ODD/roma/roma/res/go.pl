#!/usr/bin/perl
use Getopt::Long;
use utf8;
my $FILE="";
my $lang;
GetOptions(    "f|file=s" => \$FILE,           ) or exit(1);
while (<>) {
  chop;
  if (/^$/) {}
  elsif (/^\[/) {
    ($lang) = /.([a-z\-]+).*/;
  }
  elsif (/=/) {
    my ($word,$trans) = /([^=]*)=(.*)/;
    $trans{$lang}{$word}=$trans;
  }
}
foreach $l (sort keys %trans) {
  $words = $trans{$l};
print "$l: $words\n";
  foreach $w (keys hash $words)  {
    print "look at $w in $l\n";
  }
}

