use Modern::Perl;
use LWP::Simple;

my $start_url = $ARGV[0];
if (not defined $start_url) {
	say "Enter a valid URL!!!";
	die;
}

say "We are now entering " . $start_url;

