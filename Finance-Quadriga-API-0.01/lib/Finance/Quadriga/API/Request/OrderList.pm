package Finance::Quadriga::API::Request::OrderList;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/open_orders';
use constant ATTRIBUTES => qw(book);
use constant DATA_KEY   => 'orders';
use constant READY      => 1;

sub url               { URL        }
sub attributes        { ATTRIBUTES }
sub data_key          { DATA_KEY   }
sub is_ready_to_send  { READY      }
sub book              { my $self = shift; $self->get_set(@_) }

1;

__END__

