package Finance::Quadriga::API::Request::Sell;
use base qw(Finance::Quadriga::API::Request);
use strict;

use constant URL        => 'https://api.quadrigacx.com/v2/sell';
use constant ATTRIBUTES => qw(book amount price);
use constant DATA_KEY   => 'order';


sub url               { URL        }
sub attributes        { ATTRIBUTES }
sub data_key          { DATA_KEY   }
sub book              { my $self = shift; $self->get_set(@_) }
sub amount            { my $self = shift; $self->get_set(@_) }
sub price             { my $self = shift; $self->get_set(@_) }
sub is_ready_to_send  {
    my $self = shift;
    return defined $self->amount and defined $self->price;
}

1;

__END__

