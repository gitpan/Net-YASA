#!perl
use strict;
use Test::More;
use Net::YASA;
use Module::Build;
use Encode;
use utf8;

my $mb = Module::Build->current();
if ( !$mb->feature('json_support') or !$mb->notes('jsontests') ) {
    plan skip_all => 'No JSON::DWIW driver installed';
}
plan tests => 3;

use_ok( 'JSON::DWIW');
my $ny = Net::YASA->new( output => 'json' );
my $termset = $ny->extract("我要去上學我想去上學");
like (Encode::decode("utf-8",$$termset[0]{'FreqResult'}{'Term'}), qr/去上學/, 'Content from extraction');
is ($$termset[0]{'FreqResult'}{'Freq'}, 2, 'Frequency from extraction');
diag( "Testing Net::YASA function, extract in json format");

