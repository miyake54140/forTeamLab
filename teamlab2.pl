use LWP::UserAgent;

my $agent        = 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)';
my $apibaseuri   = 'https://runner.team-lab.com/q?str=%s&token=kjqSfzPUepqEScGrn6GRe77fmquCfJsp';

my @alfa = ( 'A', 'B', 'C', 'D' );

my $loop = 0;
my $chg = 0;
my $cnt = 0;
my $basetext='CACDDCADDBBBCABDAACADCBDABBCCADBACDBBDDADACBCDBCBA';
my $text='';
my $sc=1222;
while($loop<400)
{
	$cnt=0;
	$text = $basetext;
	$chg = int(rand 5) + 1;
	
	while($cnt<$chg)
	{
		substr($text,int(rand 50),1,$alfa[int(rand scalar @alfa)]);
		$cnt++;
	}

	my $url = sprintf($apibaseuri, $text);

	my $ua = LWP::UserAgent->new;
	my $req = HTTP::Request->new('GET', $url);
	$ua->agent($agent);
	my $response = $ua->request($req);

	unless ($response->is_success) {
	    print 'Request: ' . $url, "\n";
	    warn 'Failed to request to WEB API.', "\n";
	} else {
		print $text . ',' . $response->content . "\n";
		if($sc < $response->content)
		{
			$basetext = $text;
		}
	}
	$loop++;
	sleep 1;
}
