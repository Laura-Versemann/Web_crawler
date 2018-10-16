use Modern::Perl;
use LWP::Simple;
use strict;
use warnings;  
use Data::Dump qw(dump);

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

	my ($title) = ($html =~ m/<title.*>(.*)<\/title>/);
    say $title; 

    my @next_url = ($html =~ m/<a[^>]*href=\"([^\"]*)\"/g);
    say scalar@next_url; 
    dump @next_url;

    open(HTMLDATEI, ">>webpagecontent.html") || die 'Could not open urlmap'; 
    print HTMLDATEI $html; 
    close (HTMLDATEI);  

    if ($depth > 0) {
        foreach my $element (@next_url){
            get_recursive($element, $depth-1);
        }
    }
    
    # ideen:
    #Html speichern 
}
