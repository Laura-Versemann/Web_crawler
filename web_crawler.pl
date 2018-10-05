use Modern::Perl; 
#Ein einfacher webcrawler mit LWP  
use strict; 
use LWP::Simple;

my $url = shift || die 'Es gibt keine url';
my $max = 100;

my $html = get($url);

my @urls; 
while ($html =~s/(http:\/\/\s+)[">]//)
{
    push @urls, $1; 
}
mkdir "web", 0755;
open(URLMAP, "web/url.map") || die 'konnte nicht geöffnet werden';
my $count = 0; 

for (my $i = 0; $i<$max; $i++){
    my $source = $urls[int(rand($#urls+1))]; 
    getstore($source, "web$count.html"); 
    print URLMAP "$count\t$source\n";
    $count++; 
    print STDERR "Getting $count: $source\n"; 
}

close(URLMAP); 


