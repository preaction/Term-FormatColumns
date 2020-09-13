
use strict;
use warnings;
use Test::More;
use Term::FormatColumns qw(format_columns_for_width);
use utf8;

my @data = qw( foo bar baz biz blargh fizzbuzz );
my $output;

$output = format_columns_for_width 20, @data;
is $output, <<'OUTPUT', 'Output is correct for 20 character width';
foo       biz
bar       blargh
baz       fizzbuzz
OUTPUT

$output = format_columns_for_width 30, @data;
is $output, <<'OUTPUT', 'Output is correct for 30 character width';
foo       baz       blargh
bar       biz       fizzbuzz
OUTPUT

$output = format_columns_for_width 1, @data;
is $output, <<'OUTPUT', 'Output is correct for 1 character width';
foo
bar
baz
biz
blargh
fizzbuzz
OUTPUT

$output = format_columns_for_width 20, qw/foo bar baz biz fizzbuzz/;
$output =~ s/ +$//; # Avoid git whitespace errors
is $output, <<'OUTPUT', 'Short lists are padded with empty strings';
foo       biz
bar       fizzbuzz
baz
OUTPUT

my $bold = "\x1b[1mfizzbuzz\x1b[0m";
$output = format_columns_for_width 20, qw/foo bar baz biz blargh/, $bold;
is $output, <<OUTPUT, 'ANSI SGR escape sequences are handled correctly';
foo       biz
bar       blargh
baz       $bold
OUTPUT

my @strings = ( "aa", "bb", "cc", "😄😄",
                "dd", "ee", "ff", "😄😄",
                "gg", "hh", "ii", "😄😄",
                "jj", "kk", "ll", "😄😄",
              );
$output = format_columns_for_width 40, @strings;
is $output, <<OUTPUT, 'wide emoji handled correctly';
aa    😄😄  ff    hh    jj    😄😄
bb    dd    😄😄  ii    kk    
cc    ee    gg    😄😄  ll    
OUTPUT

@strings = (
                "allow", "bilbo",
                "こんにちは",
                "frodo", "snack", "fruit",
           );
$output = format_columns_for_width 40, @strings;
is $output, <<OUTPUT, 'hiragana (wide chars) handled correctly';
allow        こんにちは   snack
bilbo        frodo        fruit
OUTPUT


done_testing;
