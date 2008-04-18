package Text::Pipe::List::Grep;

use warnings;
use strict;


our $VERSION = '0.01';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    # kludge because of prototype requirements
    [ grep { $self->code->() } @$input ];
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Common text filter API

=head1 SYNOPSIS

    my $pipe = Text::Pipe->new('List::Grep', code => { $_ < 7 });
    my $result = $pipe->filter(...);

=head1 DESCRIPTION

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=back

{% PROCESS standard_pod %}

=cut

