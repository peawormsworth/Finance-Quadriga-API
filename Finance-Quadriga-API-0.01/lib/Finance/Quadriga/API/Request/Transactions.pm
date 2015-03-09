package Finance::Quadriga::API::Request::Transactions;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://quadriga.com/api2/user/transactions.json';
use constant ATTRIBUTES => qw(book time);
use constant DATA_KEY   => 'transactions';
use constant READY      => 1;

sub url              { URL        }
sub attributes       { ATTRIBUTES }
sub data_key         { DATA_KEY   }
sub is_ready_to_send { READY      } 
sub book             { my $self = shift; $self->get_set(@_) }
sub time             { my $self = shift; $self->get_set(@_) }

1;

__END__

