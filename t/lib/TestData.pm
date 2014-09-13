package 
  TestData;

use strict;
use warnings;
use Exporter qw(import);

our @EXPORT_OK = qw($CLIENT_PARAMS1 $CLIENT_PARAMS_1_9);

our $CLIENT_PARAMS1 = {
  'draw' => 1,
  'start' => 0,
  'length' => 10,
  'search[value]' => 'test_search',
  'search[regex]' => 'false',
  'order[0][column]' => 0,
  'order[0][dir]' => 'asc',
  'columns[0][name]' => 'col_name',
  'columns[0][data]' => 'col_data',
  'columns[0][orderable]' => 'true',
  'columns[0][searchable]' => 'true',
  'columns[0][search][value]' => '',
  'columns[0][search][regex]' => 'false',
};

our $CLIENT_PARAMS_1_9 = {
};


1;
