#!/usr/bin/env perl

use warnings;
use strict;
use Text::Pipe;
use Text::Pipe::Stackable;
use Test::More tests => 10;

my $pipe_trim    = Text::Pipe->new('Trim');
my $pipe_uc      = Text::Pipe->new('Uppercase');
my $pipe_repeat  = Text::Pipe->new('Repeat', times => 2, join => ' = ');
my $pipe_reverse = Text::Pipe->new('Reverse');

my $stacked_pipe = Text::Pipe::Stackable->new($pipe_trim, $pipe_uc, $pipe_repeat);

my $input = '  a test  ';

is($pipe_trim->filter($input), 'a test', 'trim');
is($pipe_uc->filter('a test'), 'A TEST', 'uppercase');
is($pipe_repeat->filter('A TEST'), 'A TEST = A TEST', 'repeat');
is($pipe_reverse->filter('a test'), 'tset a', 'reverse');

is($stacked_pipe->count, 3, 'three segments');
is($stacked_pipe->filter($input), 'A TEST = A TEST', 'stacked pipe');

$stacked_pipe->unshift($pipe_reverse);
is($stacked_pipe->count, 4, 'now four segments');
is($stacked_pipe->filter($input), 'TSET A = TSET A', 'unshift pipe');

$stacked_pipe->splice(2, 1);  # should remove the third segment (uppercase)
is($stacked_pipe->count, 3, 'now three segments');
is($stacked_pipe->filter($input), 'tset a = tset a', 'spliced pipe');
