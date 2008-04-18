package Text::Pipe::Multiplex;

use warnings;
use strict;


our $VERSION = '0.01';


use base 'Text::Pipe::Base';

    
__PACKAGE__
    ->mk_array_accessors(qw(pipes));


sub filter {
    my ($self, $input) = @_;
    [ map { $_->filter($input) } $self->pipes ];
}


sub deep_count {
    my $self = shift;
    my $count = 0;

    for my $pipe ($self->pipes) {
        if ($pipe->can('deep_count')) {
            $count += $pipe->deep_count;
        } else {
            $count++;
        }
    }

    $count;
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

