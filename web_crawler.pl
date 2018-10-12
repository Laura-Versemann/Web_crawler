use Modern::Perl;
use LWP::Simple;
use strict;
use warnings;  
use Data::Dumper qw(Dumper);

####################################
#MAIN
####################################

my $start_url = shift @ARGV || die 'Please enter startURL and depth';
my $start_depth = shift @ARGV || die 'Please enter startURL and depth';

say "URL=" . $start_url;
say "DEPTH=" . $start_depth;
say "We are now entering " . $start_url;

get_recursive($start_url, $start_depth);



######### FUNCTIONS ###########

sub get_recursive {
	my ($url, $depth) = @_;

	say "Now getting $url";
	my $html = get($url);
	say "got " . substr($html, 0, 20);

	my ($title) = ($html =~ m/<title.*>(.*)<\/title>/);
    say $title; 

	
	# SAVE THE PAGE!!!!!
}
