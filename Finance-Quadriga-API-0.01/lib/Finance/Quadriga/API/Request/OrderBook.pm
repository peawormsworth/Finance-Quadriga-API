package Finance::Quadriga::API::Request::OrderBook;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL               => 'https://api.quadrigacx.com/v2/order_book';
use constant ATTRIBUTES        => qw(book group);
use constant DATA_KEY          => 'orderbook';
use constant REQUEST_TYPE      => 'GET';
use constant IS_PRIVATE        => 0;
use constant READY             => 1;

sub request_type      { REQUEST_TYPE }
sub url               { URL          }
sub attributes        { ATTRIBUTES   }
sub data_key          { DATA_KEY     }
sub is_private        { IS_PRIVATE   }
sub is_ready_to_send  { READY        }

sub book              { my $self = shift; $self->get_set(@_) }
sub group             { my $self = shift; $self->get_set(@_) }

1;

__END__

