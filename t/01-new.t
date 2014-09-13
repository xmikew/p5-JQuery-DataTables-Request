use 5.012;
use strict;
use warnings FATAL => 'all';
use lib 't/lib';

use Test::More;

use TestData qw($CLIENT_PARAMS1);
use JQuery::DataTables::Request;

my $req = JQuery::DataTables::Request->new( client_params => $CLIENT_PARAMS1 );
isa_ok( $req, 'JQuery::DataTables::Request' );

# top level 
ok($req->start == 0, 'constructor set start properly');
ok($req->length == 10, 'constructor set length properly');
ok($req->draw  == 1, 'constructor set draw properly');

# order
ok(defined($req->order->[0]), 'constructor created order entry');
ok($req->order->[0]{column} == 0, 'constructor set proper column order column');
ok($req->order->[0]{dir} eq 'asc', 'constructor set proper column order direction');

# columns
ok(defined($req->columns->[0]), 'constructor created column entry');
ok($req->columns->[0]{name} eq 'col_name', 'constructor set column name entry');
ok($req->columns->[0]{data} eq 'col_data', 'constructor set column data entry');
ok(!$req->columns->[0]{search}{regex}, 'constructor converted to perl boolean');

# search
ok(defined($req->search), 'constructor set search entry');
ok(!$req->search->{regex},  'constructor set search regex entry');
ok($req->search->{value} eq 'test_search', 'constructor set search value entry');

done_testing;
