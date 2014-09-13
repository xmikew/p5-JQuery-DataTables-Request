use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'JQuery::DataTables::Request',
    AUTHOR           => q{Mike Wisener <xmikew_cpan_org>},
    VERSION_FROM     => 'lib/JQuery/DataTables/Request.pm',
    ABSTRACT_FROM    => 'lib/JQuery/DataTables/Request.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.012,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Carp' => 0,
        'Class::Accessor' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'JQuery-DataTables-*' },
);
