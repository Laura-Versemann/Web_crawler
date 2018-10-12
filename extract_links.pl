use strict;
use warnings;
use HTML::SimpleLinkExtor; 
use LWP::Simple 'get';


my ($url) = shift @ARGV || die "Hey, gimme a URL!"; 
my $html = get($url)  || die "Could not get '$url'"; 

my $extractor = HTML::SimpleLinkExtor->new;

$extractor->parse($html);

my @links = $extractor->links;
unless (@links) {
    print "No links founds for $url\n"; 
    exit;
}

for my $link (sort @links) { 
    print "$link\n";
}
