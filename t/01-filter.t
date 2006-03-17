# Before `make install' is performed this script should be runnable with
# `make test'.

use strict;
use warnings;
use Template;
use Test::More tests => 3;

my $tt = Template->new();
my ($template, $data, $output, $expected);

###############################################################################
# Make sure that TT works.
$template = qq{
hello world!
};
$tt->process( \$template, undef, \$output );
is( $output, $template, 'TT works' );
$output = undef;

###############################################################################
# Use NoFollow as a FILTER
$template = qq{
[%- USE NoFollow -%]
[%- FILTER nofollow -%]
<a href="http://www.google.com/">Google</a>
[%- END -%]
};
$expected = '<a rel="nofollow" href="http://www.google.com/">Google</a>';
$tt->process( \$template, undef, \$output );
is( $output, $expected, 'Works in [% FILTER ... %] block' );
$output = undef;

###############################################################################
# Use as inline filter
$template = qq{
[%- USE NoFollow -%]
[%- text | nofollow -%]
};
$data = {
    'text' => '<a href="http://www.google.com/">Google</a>',
    };
$expected = '<a rel="nofollow" href="http://www.google.com/">Google</a>';
$tt->process( \$template, $data, \$output );
is( $output, $expected, 'Works as inline filter' );
$output = undef;
