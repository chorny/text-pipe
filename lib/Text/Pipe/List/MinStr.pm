package Text::Pipe::List::MinStr;

use warnings;
use strict;
use List::Util 'minstr';


our $VERSION = '0.07';


use base 'Text::Pipe::Base';


sub filter {
    my ($self, $input) = @_;
    return $input unless ref $input eq 'ARRAY';

    minstr @$input;
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

