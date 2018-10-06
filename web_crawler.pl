use Modern::Perl;
use LWP::Simple;
use strict;
use Data::Dumper qw(Dumper);

######### MAIN ###########

say Dumper \@ARGV;
my $start_url = shift @ARGV;
my $start_depth = shift @ARGV;

if (not defined $start_url) {
	say "Enter a valid URL!!!";
	die;
}

say "We are now entering " . $start_url;

get_recursive($start_url, $start_depth);


######### FUNCTIONS ###########

sub get_recursive {
	my ($url, $depth) = @_;

	say "Now getting $url";
	my $html = get($url);
	say "got " . substr($html, 0, 20);

	my ($title) = ($html =~ m/<title>(.*)<\/title>/);
	say $title;	
	
	# SAVE THE PAGE!!!!!
}
