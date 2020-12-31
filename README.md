# NAME

Template::Plugin::NoFollow - Template Toolkit filter to add rel="nofollow" to all HTML links

# SYNOPSIS

```perl
[% use NoFollow allow=['www.example.com', '^http://example.com/'] %]
...
[% FILTER nofollow %]
  <a href="http://www.google.com/">Google</a>
[% END %]
...
[% text | nofollow %]
```

# DESCRIPTION

`Template::Plugin::NoFollow` is a filter plugin for [Template::Toolkit](https://metacpan.org/pod/Template%3A%3AToolkit), which
adds `rel="nofollow"` to all HTML links found in the filtered text.

Through the use of the `allow` option, you can specify URLs that are _not_
marked as `rel="nofollow"`.  This can be used to set up a filter that leaves
internal links alone, and that marks all external links as `rel="nofollow"`.
`allow` accepts regular expressions, so you can be as elaborate as you'd like.

# METHODS

- init()

    Initializes the template plugin.

- filter($text, $args, $conf)

    Filters the given text, and adds rel="nofollow" to links.

# AUTHOR

Graham TerMarsch <cpan@howlingfrog.com>

# COPYRIGHT

Copyright (C) 2006-2007, Graham TerMarsch.  All Rights Reserved.

This is free software; you can redistribute it and/or modify it under the same
terms as Perl itself.

# SEE ALSO

[Template::Plugin::Filter](https://metacpan.org/pod/Template%3A%3APlugin%3A%3AFilter).
