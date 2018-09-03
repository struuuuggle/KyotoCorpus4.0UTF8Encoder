#!/usr/bin/perl

# 京都テキストコーパスに対する grep
#
# Usage: grepKNP.pl <pattern>

use utf8;
use strict;
use Encode qw(decode);
use open ":std";

exit 1 unless $ARGV[0];

my $CORPUS_DIR = '../dat/syn';
my $pattern = decode('utf8', $ARGV[0]);
my ($sentence, $raw_sentence);

for my $f (glob("$CORPUS_DIR/*.KNP")) {
    open(DAT, '< :utf8', $f) or die;
    while (<DAT>) {
  if (/^EOS/) {
      $sentence .= $_;
      if ($sentence =~ /$pattern/ or $raw_sentence =~ /$pattern/) {
    print $sentence;
      }
      $sentence = '';
      $raw_sentence = '';
  }
  else {
      $sentence .= $_;
      if ($_ !~ /^(\#|\*)/) {
    $raw_sentence .= (split)[0];
      }
  }
    }
    close(DAT);
}
