use inc::Module::Install;
include 'Module::AutoInstall';

name 'Text-Pipe';
all_from 'lib/Text/Pipe.pm';
perl_version '5.006';

requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'List::Util';
requires 'Sub::Name';
requires 'UNIVERSAL::require';

recommends 'Test::Pod';
recommends 'Test::Pod::Coverage';

test_requires 'Test::More' => '0.70';
test_requires 'Test::Compile';
extra_tests;

auto_install;
auto_include;
WriteAll;
