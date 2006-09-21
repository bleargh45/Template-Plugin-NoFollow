package Template::Plugin::NoFollow;

use strict;
use warnings;
use base qw(Template::Plugin::Filter);

our $VERSION = '1.000';

sub init {
    my ($self) = @_;
    $self->{'_DYNAMIC'} = 1;
    $self->install_filter( $self->{'_ARGS'}->[0] || 'nofollow' );
    return $self;
}

sub filter {
    my ($self, $text) = @_;
    # remove any existing rel="nofollow" attrs
    $text =~ s/(<\s*a)([^>]*)\srel\s*=\s*"?nofollow"?([^>]*>)/$1$2$3/gsmi;
    # add in our rel="nofollow" attr
    $text =~ s/(<\s*a)([^>]*>)/$1 rel="nofollow"$2/gsmi;
    return $text;
};

1;

=head1 NAME

Template::Plugin::NoFollow - TT filter to add rel="nofollow" to all HTML links

=head1 SYNOPSIS

  [% use NoFollow %]
  ...
  [% FILTER nofollow %]
    <a href="http://www.google.com/">Google</a>
  [% END %]
  ...
  [% text | nofollow %]

=head1 DESCRIPTION

C<Template::Plugin::NoFollow> is a filter plugin for TT, which adds
C<rel="nofollow"> to all HTML links found in the filtered text.

=head1 AUTHOR

Graham TerMarsch <cpan@howlingfrog.com>

=head1 COPYRIGHT

This is free software; you can redistribute it and/or modify it under the same
terms as Perl itself.

=head1 SEE ALSO

L<Template::Plugin::Filter>.

=cut
