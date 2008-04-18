package Text::Pipe::Base;

use warnings;
use strict;
use UNIVERSAL::require;


our $VERSION = '0.06';


use base qw(Class::Accessor::Complex Class::Accessor::Constructor);

    
use overload
    '|'      => 'bit_or',
    fallback => 1;


__PACKAGE__->mk_constructor;


# so subclasses can call SUPER::init(@_)
sub init {}


sub filter_single {
    my ($self, $input) = @_;
    $input;
}


sub filter {
    my ($self, $input) = @_;

    if (ref $input eq 'ARRAY') {
        return [ map { $self->filter_single($_) } @$input ];
    } else {
        return $self->filter_single($input);
    }

}


sub bit_or {
    my ($lhs, $rhs) = @_;

    die "can only stack pipe segments" unless
        UNIVERSAL::isa($lhs, 'Text::Pipe::Base') &&
        UNIVERSAL::isa($rhs, 'Text::Pipe::Base');
    
    # even if either side is a Text::Pipe::Stackable already, don't push or
    # unshift because we don't want to alter the original pipes. So we'd
    # rather create nested pipes.

    # don't use() it because Text::Pipe::Stackable inherits from this class
    Text::Pipe::Stackable->require;
    Text::Pipe::Stackable->new($lhs, $rhs);
}


1;


__END__

{% USE p = PodGenerated %}

=head1 NAME

{% p.package %} - Base class for text pipe segments

=head1 SYNOPSIS

    package Text::Pipe::My::Segment;

    use base '{% p.package %}'

    sub filter { ... }

=head1 DESCRIPTION

This is the base class for all text pipe segments. It implements basic
behaviour that specific text pipe segments will want to override.

It also overloads the C<|> operator so you can create stackable pipes like
this:

    my $stackable_pipe = $pipe1 | $pipe2 | $pipe3;

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=item filter_single

Filters a single string. In this base class this method just returns the input
string unaltered.

=item filter

Can filter a single string or an reference to an array of strings. Each string
is filtered using C<filter_single()>.

=back

{% PROCESS standard_pod %}

=cut

