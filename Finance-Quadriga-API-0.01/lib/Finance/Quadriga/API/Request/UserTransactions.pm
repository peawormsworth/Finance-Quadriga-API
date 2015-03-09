package Finance::Quadriga::API::Request::UserTransactions;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/user_transactions';
use constant ATTRIBUTES => qw(offset limit sort book);
use constant DATA_KEY   => 'transactions';
use constant READY      => 1;

sub url              { URL        }
sub attributes       { ATTRIBUTES }
sub data_key         { DATA_KEY   }
sub is_ready_to_send { READY      }
sub book             { my $self = shift; $self->get_set(@_) }
sub sort             { my $self = shift; $self->get_set(@_) }
sub offset           { my $self = shift; $self->get_set(@_) }
sub limit            { my $self = shift; $self->get_set(@_) }

1;

__END__

