#!/usr/bin/perl -wT
use Test::More tests => 11;

use 5.010;
use warnings;
use strict;
use lib qw(.);

use Finance::Quadriga::API;
use Data::Dumper;

use constant DEBUG   => 0;
use constant VERBOSE => 0;

## Your Quadriga API token and secret go here...
use constant API_TOKEN          => 'Quadriga token  here';
use constant API_SECRET         => 'Quadriga secret here';

use constant PACKAGE            => 'Finance::Quadriga::API';

use constant TEST_CURRENCY_PAIR => 'BTCCAD';

use constant TEST_TICKER        => 1;
use constant TEST_TRADEBOOK     => 1;
use constant TEST_ORDERBOOK     => 1;

use constant TEST_PRIVATE       => 0;

use constant TEST_BALANCE       => 0;
use constant TEST_TRANSACTIONS  => 0;
use constant TEST_TRADE_HISTORY => 0;
use constant TEST_ORDER_HISTORY => 0;
use constant TEST_ORDER         => 0;
use constant TEST_ORDER_CANCEL  => 0;
# If you really want to do this test, then set the EXTERNAL_BITCOIN_ADDRESS to something as well...
use constant TEST_WITHDRAW      => 0;
use constant EXTERNAL_BITCOIN_ADDRESS => 'set to your own btc wallet address outside Quadriga';


use constant PUBLIC_TESTS => [
    {
        name   => 'Ticker',
        method => 'ticker',
        active => TEST_TICKER,
    },
    {
        name   => 'Tradebook',
        method => 'tradebook',
        active => TEST_TRADEBOOK,
        params => {
            currencypair => 'BTCCAD',
        },
    },
    {
        name   => 'Orderbook',
        method => 'orderbook',
        active => TEST_ORDERBOOK,
        params => {
            currencypair => 'BTCCAD',
        },
    },
];

use constant PRIVATE_TESTS => [
    {
        name   => 'Balance',
        method => 'balance',
        active => TEST_BALANCE,
    },
    {
        name   => 'Transaction',
        method => 'transactions',
        active => TEST_TRANSACTIONS,
        params => {
            currencypair => 'BTCCAD',
        },
    },
    {
        name   => 'Trade History',
        method => 'trade_history',
        active => TEST_TRADE_HISTORY,
        params => {
            currencypair => 'BTCCAD',
        },
    },
    {
        name   => 'Order History',
        method => 'order_history',
        active => TEST_ORDER_HISTORY,
        params => {
            currencypair => 'BTCCAD',
        },
    },
    {
        name   => 'Order',
        method => 'order',
        active => TEST_ORDER,
        params => {
            currencypair => 'BTCCAD',
            mode         => 'buy',
            amount       => '0.0001',
            price        => '65.01',
        },
    },
];

main->new->go;
sub new { bless {} => shift }

sub go  {
    my $self = shift;

    can_ok(PACKAGE, qw(new));

    say '=== Begin PUBLIC tests' if VERBOSE;
    isa_ok($self->set_public, PACKAGE);
    foreach my $test (@{PUBLIC_TESTS()}) {
        SKIP: {
            my ($name, $method, $active, $params) = @{$test}{qw(name method active params)};
            skip $name . ' test turned OFF', 1 unless $active;
            unless ($self->$method($self->api->$method($params ? (%$params) : ()))) {
                diag(sprintf "Error is: %s\n", Dumper $self->api->error);
            }
            ok($self->$method, 'request public ' . lc $name);
            print Data::Dumper->Dump([$self->$method],[$name]) if DEBUG;
        }
    }
    say '=== End PUBLIC tests' if VERBOSE;

    say '=== Begin PRIVATE tests' if VERBOSE;
    isa_ok($self->set_private, PACKAGE);
    foreach my $test (@{PRIVATE_TESTS()}) {
        SKIP: {
            my ($name, $method, $active, $params) = @{$test}{qw(name method active params)};
            skip $name . ' test turned OFF', 1 unless TEST_PRIVATE and $active;
            unless ($self->$method($self->api->$method($params ? (%$params) : ()))) {
                diag(sprintf "Error is: %s\n", Dumper $self->api->error);
            }
            ok($self->$method, 'request private ' . $name);
            print Data::Dumper->Dump([$self->$method],[$name]) if DEBUG;
        }
    }
    say '=== End PRIVATE tests' if VERBOSE;
}

sub set_public  { shift->api(Finance::Quadriga::API->new) }
sub set_private { shift->api(Finance::Quadriga::API->new(secret => API_SECRET, token => API_TOKEN)) }

sub api           { get_set(@_) }
sub ticker        { get_set(@_) }
sub tradebook     { get_set(@_) }
sub orderbook     { get_set(@_) }
sub balance       { get_set(@_) }
sub transactions  { get_set(@_) }
sub trade_history { get_set(@_) }
sub order_history { get_set(@_) }
sub order         { get_set(@_) }
sub order_cancel  { get_set(@_) }
sub withdraw      { get_set(@_) }

sub get_set {
   my $self      = shift;
   my $attribute = ((caller(1))[3] =~ /::(\w+)$/)[0];
   $self->{$attribute} = shift if scalar @_;
   return $self->{$attribute};
}

# These additional routines will allow you to easily encrypt your API secret using a similar but random text string as a key.
# Generate and store a random string of 22 digits and lower case chars in your script.
# You then call:
#   printf "Cyphertext: %s\n", string_encrypt($api_secret, $random_key);
# to output the cyphertext of the real secret encrypted using your key.
# Your script should then load the cyphertext from an external file and call this:
#   my $api_secret = string_decrypt($cyphertext, $random_key);
# Since both the random_key and the cyphertext are in separate files, a breach would require both files to be compromised.
# If you also put the token into a database table that is accessed during runtime... then you are further protected.
# This setup would require 3 distinct components which would all need to be compromised to gain access to your API functions.
sub alphanum_to_digit { ord($_[0]) > 57 ? ord($_[0]) - 87 : ord($_[0]) - 48  }
sub digit_to_alphanum { chr($_[0]  >  9 ?     $_[0]  + 87 :     $_[0]  + 48) }
sub string_encrypt    { join '', map(digit_to_alphanum((alphanum_to_digit(substr $_[0], $_, 1) + alphanum_to_digit(substr $_[1], $_, 1)) % 36), 0 .. length($_[0]) - 1) }
sub string_decrypt    { join '', map(digit_to_alphanum((alphanum_to_digit(substr $_[0], $_, 1) - alphanum_to_digit(substr $_[1], $_, 1)) % 36), 0 .. length($_[0]) - 1) }


1;

__END__

