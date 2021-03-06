#!/usr/bin/perl
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;

use strict;
use warnings;

use lib 't/lib', 'lib';

use Test::More;
$TODO = q{Mouse is not yet completed};
use Test::Exception;


{

    package Bar;
    use Mouse;

    ::lives_ok { extends 'Foo' } 'loaded Foo superclass correctly';
}

{

    package Baz;
    use Mouse;

    ::lives_ok { extends 'Bar' } 'loaded (inline) Bar superclass correctly';
}

{

    package Foo::Bar;
    use Mouse;

    ::lives_ok { extends 'Foo', 'Bar' }
    'loaded Foo and (inline) Bar superclass correctly';
}

{

    package Bling;
    use Mouse;

    ::throws_ok { extends 'No::Class' }
    qr{Can't locate No/Class\.pm in \@INC},
    'correct error when superclass could not be found';
}

{
    package Affe;
    our $VERSION = 23;
}

{
    package Tiger;
    use Mouse;

    ::lives_ok { extends 'Foo', Affe => { -version => 13 } }
    'extends with version requirement';
}

{
    package Birne;
    use Mouse;

    ::throws_ok { extends 'Foo', Affe => { -version => 42 } }
    qr/Affe version 42 required--this is only version 23/,
    'extends with unsatisfied version requirement';
}

done_testing;
