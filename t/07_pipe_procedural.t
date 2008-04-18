#!/usr/bin/env perl

use warnings;
use strict;
use Text::Pipe 'pipe';
use Test::More tests => 8;

my $pipe_trim    = pipe 'Trim';
my $pipe_uc      = pipe 'Uppercase';
my $pipe_repeat  = pipe 'Repeat', times => 2, join => ' = ';
my $pipe_reverse = pipe 'Reverse';

my $stacked_pipe = $pipe_trim | $pipe_uc | $pipe_repeat;

my $input = '  a test  ';

is($pipe_trim->filter($input), 'a test', 'trim');
is($pipe_uc->filter('a test'), 'A TEST', 'uppercase');
is($pipe_repeat->filter('A TEST'), 'A TEST = A TEST', 'repeat');
is($pipe_reverse->filter('a test'), 'tset a', 'reverse');

is($stacked_pipe->deep_count, 3, 'three segments');
is($stacked_pipe->filter($input), 'A TEST = A TEST', 'stacked pipe');

$stacked_pipe->unshift($pipe_reverse);
is($stacked_pipe->deep_count, 4, 'now four segments');
is($stacked_pipe->filter($input), 'TSET A = TSET A', 'unshift pipe');

