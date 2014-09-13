=head1 NAME

JQuery::DataTables::Request - represents a DataTables server-side request

=head1 SYNOPSIS

 my $dt_req = JQuery::DataTables::Request->new( $client_parameters );
 if ( $dt_req->column(0)->{searchable} ) {
   # do something
 }

 $dt_req->search->{value}; # the global search value
 if ($dt_req->search->{regex}) {
   # global search is set to regex
 }

 # find the column definition with the name 'col_name'
 my $cols = $dt_req->find_columns( by_name => 'col_name' );

 $dt_req->draw; #sEcho or draw parameter
 $dt_req->start; #iDisplayStart or start parameter

=head1 DESCRIPTION

This module represents a DataTables server-side request originating from the DataTables
client side JS library. There are two major versions of DataTables(v1.9 and v1.10) that send
differently named parameters server-side for processing. This module only provides an API
that corresponds to the v1.10 parameters but maps the v1.9 parameters to the corresponding v1.10
parameters. 

Each column parameter is represented as a HashRef like so:

 {
   name => 'col_name',
   data => 'col_name',
   orderable => 1,
   searchable => 1,
   search => {
     value => 'search string',
     regex => 0,
   }
 }

e.g.

 $dt_req->column(0)->{search}{value}

Order parameters look like this:

 {
   dir => 'asc',
   column => 1
 }   

e.g.

 $dt_req->order(0)->{dir}

The order and column accessors are indexed the same way as your column parameters so ->column(0)
returns the column in the dt_params as [columns][0] - order is similar.

=head1 METHODS

=head2 new

Creates a new JQuery::DataTables::Request object. 

 my $dt_request = JQuery::DataTables::Request->new( client_params => $c->parameters );

Accepts the following parameters

=over

=item client_params

This is a HashRef that should contain your DataTables parameters as provided by the DataTables 
JS library. Any parameters provided that are not recognized as DataTables request are silently ignored.

=back

new will confess/croak on the following scenarios:

=over

=item client_params is not provided

=item client_params is not a HashRef

=item client_params isn't recognized as containing DataTables parameters

=back

You should catch these if you are worried about it.

=head2 column

 my \%column = $request->column(0);

Returns a single column definition of the requested index

=head2 columns

 my \@columns = $request->columns([0,1]);

Returns column definitions for the requested indexes. Can accept either an 
arrayref of scalars or a single column scalar. If no column index is provided
all columns are returned. 

=head2 columns_hashref

Get all column definitions as a Hashref, with the column index as the key

=head2 find_columns

 $request->find_columns( %options )

where %options hash accepts the following parameters:

=over

=item by_name

by_name accepts a scalar or arrayref of values and returns a an arrayref of
column definitions

 my \@columns = $request->find_columns( by_name => ['col_name',col_name2] );

Searchs the columns data and/or name parameter. Example return:

=item search_field

 my \@columns = $request->find_columns( by_name => 'something', search_field => 'name' );

Set to either 'name' or 'data' to search those respective fields when
doing a by_name seach. If no search_field is specified, by_name searches
that match either field will be returned (i.e. defaults to search both fields)

=item by_idx

 my \@columns = $request->find_columns( by_idx => $col_idx )

This is just a passthrough to $request->columns( $col_idx );

=back

=head2 datatables_request_version

 my $version = $request->datatables_request_version( \%client_params )

Returns the version of DataTables we need to support based on the parameters sent. 
v1.9 version of DataTables sends different named parameters than v1.10. Returns a string
of '1.9' if we think we have a 1.9 request, '1.10' if we think it is a 1.10 request or undef
if we dont' think it is a DataTables request at all.

=head1 PRIVATE METHODS


=head2 _process_v1_9_params

Processes v1.9 parameters, mapping them to 1.10 parameters

 $self->_process_v1_9_params( \%client_params )

where \%client_params is a HashRef containing the v1.9 parameters that DataTables
client library sends the server in server-side mode.

=head2 _process_v1_10_params

 $self->_process_v1_10_params( \%client_params );

where \%client_params is a HashRef containing the v1.10 parameters that DataTables
client library sends the server in server-side mode.

=head2 _validate_and_convert

Validates parameters are set properly and does boolean conversion

=head1 AUTHOR

Mike Wisener - xmikew_cpan_org

=head1 LICENSE

perl

