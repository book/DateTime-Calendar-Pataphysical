use strict;
BEGIN { $^W = 1 }

use Test::More tests => 13;
use DateTime::Calendar::Pataphysical;

#########################

my $d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 1 );

isa_ok( $d->language, 'DateTime::Language::French' );
is( $d->day_name, 'dimanche', 'French week name' );

$d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 4, language => 'English' );

isa_ok( $d->language, 'DateTime::Language::English' );
is( $d->day_name, 'Wednesday', 'English week name' );

$d->set( language => 'French' );
isa_ok( $d->language, 'DateTime::Language::French' );

my $l = DateTime::Language->new( language => 'Dutch' );
$d->set( language => $l );
isa_ok( $d->language, 'DateTime::Language::Dutch' );
is( $d->day_name, 'woensdag', 'Dutch week name' );

$d = DateTime::Calendar::Pataphysical->new(
            year => 130, month => 7, day => 29, language => $l );
is( $d->day_name, 'hunyadi', 'Dutch name hunyadi' );

$d->set( language => 'English' );
is( $d->day_name, 'Hunyadi', 'English name Hunyadi' );

$d = DateTime::Calendar::Pataphysical->from_epoch( epoch => 0,
                                                   language => 'English' );
isa_ok( $d->language, 'DateTime::Language::English',
        'from_epoch() accepts language' );

$d = DateTime::Calendar::Pataphysical->now( language => 'Dutch' );
isa_ok( $d->language, 'DateTime::Language::Dutch',
        'now() accepts language' );

$d = DateTime::Calendar::Pataphysical->from_object( object => $d,
                                                    language => 'English' );
isa_ok( $d->language, 'DateTime::Language::English',
        'from_object() accepts language' );

$d = DateTime::Calendar::Pataphysical->last_day_of_month(
            year => 130, month => 1, language => 'Dutch' );
isa_ok( $d->language, 'DateTime::Language::Dutch',
        'last_day_of_month() accepts language' );
