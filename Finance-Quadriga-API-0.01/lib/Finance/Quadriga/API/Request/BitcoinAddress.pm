package Finance::Quadriga::API::Request::BitcoinAddress;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/bitcoin_deposit_address';
use constant ATTRIBUTES => qw();
use constant READY      => 1;

sub url              { URL }
sub attributes       { ATTRIBUTES }
sub is_ready_to_send { READY }

1;

__END__

