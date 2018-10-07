use Modern::Perl;
use LWP::Simple;

####################################
#MAIN
####################################

my ($start_url, $start_depth) =  @_;

if (not defined $start_url) {
	say "Enter a valid URL!!!";
	die;
}

say "We are now entering " . $start_url;

get_recursive($start_url, $start_depth);




sub get_recursive
{
   my ($url, $depth) = @_; 
   my $html = get($url);
   my ($title) = ~"<title>.*<\/title>";
   $title = ~s/ 
   #Speichern 
}

