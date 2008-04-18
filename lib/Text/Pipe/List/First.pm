package Text::Pipe::List::First;

use warnings;
use strict;
use List::Util 'first';


our $VERSION = '0.01';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    # kludge because of prototype requirements
    first { $self->code->() } @$input;
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Common text filter API

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('List::First', code => { $_ < 7 });
    my $result = $pipe->filter(...);

=head1 DESCRIPTION

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=item filter

If the input is an array reference, it passes each element to the code
reference. The element will be in C<$_>. Returns the first element for which
the code reference returns a true value.

If the input is a single string, it just returns that string. This is
semantically correct - if there is only one string, it has to be the first one
as well.

=back

{% PROCESS standard_pod %}

=cut

