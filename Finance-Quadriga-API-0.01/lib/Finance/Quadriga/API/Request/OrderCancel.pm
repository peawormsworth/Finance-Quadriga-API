package Finance::Quadriga::API::Request::OrderCancel;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/cancel_order';
use constant ATTRIBUTES => qw(id);
use constant DATA_KEY   => 'orders';

sub url               { URL        }
sub attributes        { ATTRIBUTES }
sub data_key          { DATA_KEY   }
sub id                { my $self = shift; $self->get_set(@_) }
sub is_ready_to_send  { defined shift->id }

1;

__END__

