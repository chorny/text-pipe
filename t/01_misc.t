#!/usr/bin/env perl

use warnings;
use strict;
use Text::Pipe 'pipe';
use Text::Pipe::Stackable;
use Test::More tests => 24;

my $pipe_trim    = Text::Pipe->new('Trim');
my $pipe_uc      = Text::Pipe->new('Uppercase');
my $pipe_repeat  = Text::Pipe->new('Repeat', times => 2, join => ' = ');
my $pipe_reverse = Text::Pipe->new('Reverse');

isa_ok($pipe_trim,    'Text::Pipe::Trim');
isa_ok($pipe_uc,      'Text::Pipe::Uppercase');
isa_ok($pipe_repeat,  'Text::Pipe::Repeat');
isa_ok($pipe_reverse, 'Text::Pipe::Reverse');

my $stacked_pipe = Text::Pipe::Stackable->new(
    $pipe_trim, $pipe_uc, $pipe_repeat
);

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

is(pipe('Append')->filter('a test'), 'a test', 'append empty');
is(pipe('Append', text => 'foobar')->filter('a test'), 'a testfoobar',
    'append text');

is(pipe('Prepend')->filter('a test'), 'a test', 'prepend empty');
is(pipe('Prepend', text => 'foobar')->filter('a test'), 'foobara test',
    'prepend text');

is(pipe('Chop')->filter("a test\n"), 'a test', 'chop newline');
is(pipe('Chop')->filter('a test'), 'a tes', 'chop non-newline');

is(pipe('Chomp')->filter("a test\n"), 'a test', 'chop newline');
is(pipe('Chomp')->filter('a test'), 'a test', 'chop non-newline');

is(pipe('UppercaseFirst')->filter('test'), 'Test', 'ucfirst');
is(pipe('LowercaseFirst')->filter('TEST'), 'tEST', 'lcfirst');

