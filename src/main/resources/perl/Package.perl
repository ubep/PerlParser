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

    if ( $Bla > 5 ) {
        print $Bla;
    } else {
        if ( ($Bla < 0) || ( (defined $Obj) && $Obj->{'abc'} < 3) ) {

	    return $Obj;

	}
    }

    return;
}

1;
