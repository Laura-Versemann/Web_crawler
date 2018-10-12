use Modern::Perl; 
use strict; 
use LWP::Simple; 

###########################
#MAIN
###########################

my $url = shift || die 'Please enter a valid URL';
my $max = 10; 

my $html = get($url); 

my @urls; 

while ($html =~s/https:\/\/\s+)[">]//){ 
    push $urls, $1;                   #$1 eq to http:xxx
}

mkdir "web", 0755; 
open(URLMAP, "/web/url.map") || die 'Could not open urlmap'; 
my $count = 0; 

for (my $i = 0; $i < $max; $i++){
    my $source = $urls[int(rand($#urls+1))]; 
    getstore($source, "web$count.html");
    print URLMAP "$count\t$source\n"; 
    print STDERR "Getting $count :  $source\n"); 
    $count++; 
}

close URLMAP; 
