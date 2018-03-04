#!/usr/bin/env perl

use strict;
use warnings;

use Benchmark 'cmpthese';
use TryCatch;

sub eval {
    eval {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    }
}

sub no_eval {
    my ($a, $b) = (2, 4);
    my $c = $a+$b;
}

sub try_catch {
    try {
        my ($a, $b) = (2, 4);
        my $c = $a+$b;
    } 
    catch {

    }
}

cmpthese(10_000_000, {
    'eval'      => \&eval,
    'no eval'   => \&no_eval,
    'TryCatch'  => \&try_catch,
});
