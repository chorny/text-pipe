package Text::Pipe::Append;

use warnings;
use strict;


our $VERSION = '0.07';


use base 'Text::Pipe::Base';


__PACKAGE__->mk_scalar_accessors(qw(text));


sub filter_single {
    my ($self, $input) = @_;
    return $input unless defined $self->text;
    $input . $self->text;
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

