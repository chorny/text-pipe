use Test::More;
use utf8;
use Test::Spelling;
add_stopwords(map { split /[\s\:\-]/ } <DATA>);
$ENV{LANG} = 'C';
all_pod_files_spelling_ok('lib');
__DATA__
API
CPAN
Marcel
Grünauer
unshifts
ref
behaviour
