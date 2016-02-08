package DE_EPAGES::Order::API::Basket;
use base Exporter;

use DE_EPAGES::Object::API::Factory qw( Transaction LoadRootObject );

# test comment!
use strict;


sub new {
    my $class = shift;
    my $self  = bless {}, $class;
    return $self;
}

sub execute {
    my $self = shift;
    my $Obj = $self->{'obj'};

    my $Bla = $self->{$xxx}->{'lala'};

    return;
}

1;