package Text::Pipe::Stackable;

use warnings;
use strict;


our $VERSION = '0.02';


use base 'Text::Pipe::Base';

    
__PACKAGE__
    ->mk_array_accessors(qw(pipes));


{
    no warnings 'once';

    # aliases to make it more natural

    *pop     = *pipes_pop;
    *push    = *pipes_push;
    *shift   = *pipes_shift;
    *unshift = *pipes_unshift;
    *count   = *pipes_count;
    *clear   = *pipes_clear;
    *splice  = *pipes_splice;
}


sub new {
    my ($class, @pipes) = @_;
    my $self = ref  $class ? $class : bless {}, $class;
    $self->pipes(@pipes);
    $self;
}


sub filter {
    my ($self, $input) = @_;
    $input = $_->filter($input) for $self->pipes;
    $input;
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

{% p.package %} - Stackable text pipes

=head1 SYNOPSIS

    my $pipe_trim    = Text::Pipe->new('Trim');
    my $pipe_uc      = Text::Pipe->new('Uppercase');
    my $pipe_repeat  = Text::Pipe->new('Repeat',
            times => 2, join => ' = ');
    my $pipe_reverse = Text::Pipe->new('Reverse');

    my $stacked_pipe = Text::Pipe::Stackable->new(
        $pipe_trim, $pipe_uc, $pipe_repeat
    );

    my $result = $stacked_pipe->filter(...);


=head1 DESCRIPTION

{% p.write_inheritance %}

=head1 METHODS

=over 4

{% p.write_methods %}

=back

{% PROCESS standard_pod %}

=cut

