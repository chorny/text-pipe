package Text::Pipe::Tester;

use strict;
use warnings;
use Text::Pipe;
use Test::More;


our $VERSION = '0.07';


use base 'Exporter';


our @EXPORT = qw(pipe_ok);



sub pipe_ok {
    my ($type, $options, $input, $expect, $name) = @_;
    $name = $type unless defined $name;
    my $pipe = Text::Pipe->new($type, @$options);
    if (ref $expect eq 'ARRAY') {
        is_deeply($pipe->filter($input), $expect, $name);
    } else {
        is($pipe->filter($input), $expect, $name);
    }
}


1;


__END__



=head1 NAME

Text::Pipe::Tester - Common text filter API

=head1 SYNOPSIS

    Text::Pipe::Tester->new;

=head1 DESCRIPTION

=head1 METHODS

=over 4



=back

Text::Pipe::Tester inherits from L<Exporter>.

The superclass L<Exporter> defines these methods and functions:

    as_heavy(), export(), export_fail(), export_ok_tags(), export_tags(),
    export_to_level(), import(), require_version()

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007-2008 by the authors.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

