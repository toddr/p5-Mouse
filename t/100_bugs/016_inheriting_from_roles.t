#!/usr/bin/perl
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;

use strict;
use warnings;

use Test::More;
use Test::Exception;


{
    package My::Role;
    use Mouse::Role;
}
{
    package My::Class;
    use Mouse;

    ::throws_ok {
        extends 'My::Role';
    } qr/You cannot inherit from a Mouse Role \(My\:\:Role\)/,
    '... this croaks correctly';
}

done_testing;
