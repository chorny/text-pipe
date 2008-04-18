package Text::Pipe::List::Reduce;

use warnings;
use strict;
use List::Util 'reduce';


our $VERSION = '0.05';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(code));


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    # kludge because of prototype requirements
    reduce { $self->code->($a, $b) } @$input;
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

