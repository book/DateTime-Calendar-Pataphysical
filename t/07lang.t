use strict;
BEGIN { $^W = 1 }

use Test::More tests => 13;
use DateTime::Calendar::Pataphysical;

#########################

my $d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 1 );

isa_ok( $d->locale, 'DateTime::Locale::fr' );
is( $d->day_name, 'dimanche', 'French week name' );

$d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 4, locale => 'English' );

isa_ok( $d->locale, 'DateTime::Locale::root' );
is( $d->day_name, 'Wednesday', 'English week name' );

$d->set( locale => 'French' );
isa_ok( $d->locale, 'DateTime::Locale::fr' );

my $l = DateTime::Locale->load( 'Dutch' );
$d->set( locale => $l );
isa_ok( $d->locale, 'DateTime::Locale::nl' );
is( $d->day_name, 'woensdag', 'Dutch week name' );

$d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 29, locale => $l );
is( $d->day_name, 'hunyadi', 'Dutch name hunyadi' );

$d->set( locale => 'English' );
is( $d->day_name, 'Hunyadi', 'English name Hunyadi' );

$d = DateTime::Calendar::Pataphysical->from_epoch( epoch => 0,
                                                   locale => 'English' );
isa_ok( $d->locale, 'DateTime::Locale::root',
        'from_epoch() accepts locale' );

$d = DateTime::Calendar::Pataphysical->now( locale => 'Dutch' );
isa_ok( $d->locale, 'DateTime::Locale::nl',
        'now() accepts locale' );

$d = DateTime::Calendar::Pataphysical->from_object( object => $d,
                                                    locale => 'English' );
isa_ok( $d->locale, 'DateTime::Locale::root',
        'from_object() accepts locale' );

$d = DateTime::Calendar::Pataphysical->last_day_of_month(
            year => 130, month => 1, locale => 'Dutch' );
isa_ok( $d->locale, 'DateTime::Locale::nl',
        'last_day_of_month() accepts locale' );
