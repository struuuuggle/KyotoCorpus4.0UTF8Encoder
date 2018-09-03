#!/usr/bin/perl

# 毎日新聞オリジナルデータと差分データからコーパスデータを再現

use utf8;
use strict;
use Encode;
use vars qw(%opt %rel_list);
use Getopt::Long;
use open IO => ':encoding(utf-8)';
use open ":std";

&GetOptions(\%opt, 'rel=s');

if ($opt{rel}) {
    open(LIST, $opt{rel}) or die "Can't open $opt{rel}\n";
    while (<LIST>) {
  chomp;
  $rel_list{$_}++;
    }
    close(LIST);
}

open(ORG, "$ARGV[0].org") or die "Can't find $ARGV[0].org\n";
open(NUM, "$ARGV[0].num") or die "Can't find $ARGV[0].num\n";
open(KNP, "> $ARGV[0].KNP") or die "Can't open $ARGV[0].KNP\n";

my ($sid, $aid, $sentence, $print_flag);
while (<NUM>) {
    if (/^\# S-ID:((\d+)-\d+)/) {
        $sid = $1;
        $aid = $2;
        if (!$opt{rel} or $rel_list{$aid}) {
            print KNP;
            $sentence = undef;
            while (<ORG>) {
                if (/^\# S-ID:$sid/) {
                    $sentence = <ORG>;
                    last;
                }
            }
            # 文がみつからないとき
            die "Can't find $sid in $ARGV[0].org" if !$sentence or $sentence =~ /^\#/;
            $print_flag = 1;
  }
  else {
      $print_flag = 0;
  }
    }
    elsif ($print_flag) {
  if (/^EOS/) {
      print KNP;
  }
  elsif (/^\*/) {
      print KNP;
  }
  elsif (/^\+/) {
      if ($opt{rel}) {
    print KNP;
      }
  }
  else {
      my @list = split;
      my ($pos, $len) = split('-', $list[0]);
      $list[0] = substr($sentence, $pos, $len);
      print KNP join(' ', @list), "\n";
  }
    }
}

END {
    close(ORG);
    close(NUM);
    close(KNP);
}
