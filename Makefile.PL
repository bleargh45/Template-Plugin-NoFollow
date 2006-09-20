use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'          => 'Template::Plugin::NoFollow',
    'VERSION_FROM'  => 'lib/Template/Plugin/NoFollow.pm',
    'ABSTRACT'      => 'TT plugin to add rel="nofollow" to HTML links',
    'AUTHOR'        => 'Graham TerMarsch <cpan@howlingfrog.com>',
    'PREREQ_PM'     => { 'Template'     => 2.00,
                         'Test::More'   => 0,
                       },
    'clean'         => { 'FILES' => '$(DISTVNAME).tar.gz' },
    );
