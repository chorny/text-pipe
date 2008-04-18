package Text::Pipe::Code;

use warnings;
use strict;


our $VERSION = '0.03';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    $self->code->($input);
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Filter text through a code ref

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('Code', code => sub {
        my $input = shift;
        ...
    });

    my $result = $pipe->filter(...);

=head1 DESCRIPTION

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=item filter

Passes the input to the code reference and returns the result. No distinction
is made between single strings and references to array of strings.

=back

{% PROCESS standard_pod %}

=cut

