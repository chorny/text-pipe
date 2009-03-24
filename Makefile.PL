use inc::Module::Install;
include 'Module::AutoInstall';

name 'Text-Pipe';
all_from 'lib/Text/Pipe.pm';
perl_version '5.006';

homepage 'http://search.cpan.org/dist/Text-Pipe/';
bugtracker 'http://rt.cpan.org/Public/Dist/Display.html?Name=Text-Pipe';
repository 'http://github.com/hanekomu/text-pipe/tree/master';

requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'List::Util';
requires 'Sub::Name';
requires 'UNIVERSAL::require';

test_requires 'Test::More' => '0.70';
extra_tests;

auto_install;
auto_include;
WriteAll;
