Finance-Quadriga-API
====================

Quadriga public and private API interface

Also available on MetaCPAN: 

     https://metacpan.org/pod/Finance::Quadriga::API

Install using CPAN:

     $ perl -MCPAN -e 'install Finance::Quadriga::API'

Sample Usage:

    my $api = Finance::Quadriga::API->new(key => $key, secret => $secret);
    my $buy = $api->buy(book => 'btc_cad', amount => '1.5', price => '350.00');

    if ($buy) {
        printf "The Quadriga order ID is %s.\n", $order->{id};
    }
    else {
        printf "An error occurred: %s\n", $api->error;
    }


COPYRIGHT AND LICENSE

    Copyright (C) 2014 by Jeff Anderson

see individual license in each package under LICENSE


