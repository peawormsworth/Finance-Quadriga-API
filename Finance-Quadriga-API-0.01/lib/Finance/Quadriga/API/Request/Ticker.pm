package Finance::Quadriga::API::Request::Ticker;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL          => 'https://api.quadrigacx.com/v2/order_book';
use constant ATTRIBUTES   => qw(book group);
use constant REQUEST_TYPE => 'GET';
use constant DATA_KEY     => 'ticker';
use constant IS_PRIVATE   => 0;
use constant READY        => 1;

sub url              { URL }
sub attributes       { ATTRIBUTES }
sub request_type     { REQUEST_TYPE }
sub data_key         { DATA_KEY }
sub is_private       { IS_PRIVATE }
sub is_ready_to_send { READY }
sub book             { my $self = shift; $self->get_set(@_) }
sub group            { my $self = shift; $self->get_set(@_) }

1;

__END__

