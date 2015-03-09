package Finance::Quadriga::API::Request::BitcoinWithdraw;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/bitcoin_withdrawal';
use constant ATTRIBUTES => qw(amount address);

sub amount   { my $self = shift; $self->get_set(@_) }
sub address  { my $self = shift; $self->get_set(@_) }

sub url              { URL }
sub attributes       { ATTRIBUTES }
sub is_ready_to_send { 
    my $self = shift;
    return defined $self->amount and defined $self->address;
}

1;

__END__

