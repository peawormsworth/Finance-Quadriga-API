package Finance::Quadriga::API::Request::Balance;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://quadriga.com/api2/user/balance.json';
use constant ATTRIBUTES => qw();
use constant DATA_KEY   => 'balance';
use constant READY      => 1;

sub url               { URL        }
sub attributes        { ATTRIBUTES }
sub data_key          { DATA_KEY   }
sub is_ready_to_send  { READY      }

1;

__END__

