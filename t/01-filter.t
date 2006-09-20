use strict;
use warnings;
use Template;
use Test::More tests => 5;

my $text     = '<a href="http://www.google.com/">Google</a>';
my $expected = '<a rel="nofollow" href="http://www.google.com/">Google</a>';

###############################################################################
# Make sure that TT works.
check_tt: {
    my $tt = Template->new();
    my $template = qq{hello world!};
    my $output;
    $tt->process( \$template, undef, \$output );
    is( $output, $template, 'TT works' );
}

###############################################################################
# Use NoFollow as a FILTER
filter: {
    my $tt = Template->new();
    my $template = qq{
[%- USE NoFollow -%]
[%- FILTER nofollow -%]
$text
[%- END -%]
};
    my $output;
    $tt->process( \$template, undef, \$output );
    is( $output, $expected, 'Works in [% FILTER ... %] block' );
}

###############################################################################
# Use as named FILTER
named_filter: {
    my $tt = Template->new();
    my $template = qq{
[%- USE foo = NoFollow -%]
[%- FILTER \$foo -%]
$text
[%- END -%]
};
    my $output;
    $tt->process( \$template, undef, \$output );
    is( $output, $expected, 'Works in named [% FILTER ... %] block' );
}

###############################################################################
# Use as inline filter
filter_inline: {
    my $tt = Template->new();
    my $template = qq{
[%- USE NoFollow -%]
[%- text | nofollow -%]
};
    my $output;
    $tt->process( \$template, { 'text' => $text }, \$output );
    is( $output, $expected, 'Works as inline filter' );
}

###############################################################################
# Use as named inline filter
named_filter_inline: {
    my $tt = Template->new();
    my $template = qq{
[%- USE foo = NoFollow -%]
[%- text | \$foo -%]
};
    my $output;
    $tt->process( \$template, { 'text' => $text }, \$output );
    is( $output, $expected, 'Works as named inline filter' );
}
