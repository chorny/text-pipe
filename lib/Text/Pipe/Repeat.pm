package Text::Pipe::Repeat;

use warnings;
use strict;


our $VERSION = '0.02';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(times join));


use constant DEFAULTS => (
    times => 2,
    join  => '',
);


sub filter_single {
    my ($self, $input) = @_;
    my $output = '';

    # temp variables in case we have to loop many times, in which case
    # repeated trips to the accessors would be inefficient.

    my $times = $self->times;
    my $join  = $self->join;

    for (1 .. $times) {
        $output .= $input;
        $output .= $join unless $_ eq $times;
    }
    $output;
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Common text filter API

=head1 SYNOPSIS

    {% p.package %}->new;

=head1 DESCRIPTION

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=back

{% PROCESS standard_pod %}

=cut

