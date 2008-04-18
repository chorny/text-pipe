package Text::Pipe::Split;

use warnings;
use strict;


our $VERSION = '0.04';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(pattern limit));


sub filter {
    my ($self, $input) = @_;

    return $input if ref $input;

    my $pattern = $self->pattern;
    $pattern = '' unless defined $pattern;

    my $limit = $self->limit;
    $limit = 0 unless defined $limit;

    [ split /$pattern/ => $input, $limit ];
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Common text filter API

=head1 SYNOPSIS

    {% p.package %}->new;

=head1 DESCRIPTION

This pipe segment can split a string along a pattern into an array. It works
like perl's C<split()>.

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=item filter

Takes a string input and splits it along the pattern, respecting the limit
like perl's C<split()> function.

If something else than a string is passed, it is returned unchanged.

=back

{% PROCESS standard_pod %}

=cut

