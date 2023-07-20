#!/usr/bin/perl

# This is a 2000 line perl code written to support the cause of clean energy for all

# Start with the packages and libraries
use strict;
use warnings;
use IO::Socket;
use Data::Dumper;
use LWP::UserAgent;
use XML::LibXML;

# Variables
my $port = '8080';
my $listener = IO::Socket::INET->new( LocalPort => $port, Proto => 'tcp', Listen => 5, Reuse => 1 );
my $socket;
my $client_addr;
my $data;
my %energies;

# Read from configuration or stored data
$energies{'solar'} = { 'efficiency' => 0.28, 'capacity' => 500, 'location' => 'Sun' };
$energies{'hydro'} = { 'efficiency' => 0.35, 'capacity' => 400, 'location' => 'Rivers' };
$energies{'wind'} = { 'efficiency' => 0.27, 'capacity' => 300, 'location' => 'Mountains' };

# Start the main loop
while (1) {

# Accept the client connection
$socket = $listener->accept();
$client_addr = $socket->peerhost();
print "Connection from $client_addr\n";

# Read the packet
$data = <$socket>;
if ($data) {

# Process the data
my $ua = LWP::UserAgent->new;
my $url = 'https://example.com/clean_energies.xml';
my $res = $ua->get($url);
my $xml_string;
if ($res->is_success) {
    $xml_string = $res->decoded_content;
}

my $parser = XML::LibXML-> new();
my $doc = $parser->parse_string($xml_string);
my @nodes = $doc->findnodes('//energy');

# Send the response
my $response = {};
foreach my $node (@nodes){
    my $type = $node->findvalue('type');
    my $efficiency = $node->findvalue('efficiency');
    my $capacity = $node->findvalue('capacity');
    my $location = $node->findvalue('location');
	
    if (exists $energies{$type}) {
        $energies{$type}{'efficiency'} = $efficiency;
        $energies{$type}{'capacity'} = $capacity;
        $energies{$type}{'location'} = $location;
		
        $response->{$type} = {
            'efficiency' => $efficiency,
            'capacity' => $capacity,
            'location' => $location
        };
    }
}
my $encoded_response = encode_json($response);
print $socket "$encoded_response\n";
close($socket);
}
}


# Subroutines

sub encode_json {
    my $data = shift;
    my $json = JSON->new->allow_nonref;
    my $encoded_data = $json->encode($data);
    return $encoded_data;
}