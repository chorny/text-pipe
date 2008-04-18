package Text::Pipe::Tester;

use strict;
use warnings;
use Text::Pipe;
use Test::More;


our $VERSION = '0.07';


use base 'Exporter';


our @EXPORT = qw(pipe_ok);



sub pipe_ok {
    my ($type, $options, $input, $expect, $name) = @_;
    $name = $type unless defined $name;
    my $pipe = Text::Pipe->new($type, @$options);
    if (ref $expect eq 'ARRAY') {
        is_deeply($pipe->filter($input), $expect, $name);
    } else {
        is($pipe->filter($input), $expect, $name);
    }
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Common text filter API

=head1 SYNOPSIS

    {% p.package %}->new;

=head1 DESCRIPTION

=head1 METHODS

=over 4

{% p.write_methods %}

=back

{% p.write_inheritance %}

{% PROCESS standard_pod %}

=cut

