use ExtUtils::MakeMaker;
WriteMakefile(
    NAME		    => 'DateTime::Calendar::Pataphysical',
    VERSION_FROM	=> 'lib/DateTime/Calendar/Pataphysical.pm',
    PREREQ_PM		=> { DateTime::Locale => 0,
                         DateTime::Duration => 0,
                         Params::Validate => 0.52,
                       },
    ABSTRACT        => "Dates in the pataphysical calendar",
    AUTHOR          => 'Eugene van der Pijll <pijll@gmx.net>',
);
