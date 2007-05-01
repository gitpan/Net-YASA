use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Net::YASA',
    license             => 'perl',
    dist_author         => 'Cheng-Lung Sung <clsung@FreeBSD.org>',
    dist_version_from   => 'lib/Net/YASA.pm',
    build_requires => {
	'Encode' => 0,
	'LWP::UserAgent' => 0
    },
    add_to_cleanup      => [ 'Net-YASA-*' ],
);

$builder->create_build_script();
