package Finance::Quadriga::API::Request::TradeBook;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL          => 'https://api.quadrigacx.com/v2/transactions';
use constant REQUEST_TYPE => 'GET';
use constant ATTRIBUTES   => qw(book time);
use constant IS_PRIVATE   => 0;
use constant DATA_KEY     => 'transactions';
use constant READY        => 1;

sub request_type     { REQUEST_TYPE }
sub url              { URL          }
sub attributes       { ATTRIBUTES   }
sub data_key         { DATA_KEY     }
sub is_ready_to_send { READY        } 
sub is_private       { IS_PRIVATE   }
sub book             { my $self = shift; $self->get_set(@_) }
sub time             { my $self = shift; $self->get_set(@_) }

1;

__END__

