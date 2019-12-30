use LWP::UserAgent;

my $agent        = 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)';
my $apibaseuri   = 'https://runner.team-lab.com/q?str=%s&token=kjqSfzPUepqEScGrn6GRe77fmquCfJsp';

my @alfa = ( 'A', 'B', 'C', 'D' );
#my @ptn = (
#'AAA','AAB','AAC','AAD','ABA','ABB','ABC','ABD','ACA','ACB','ACC','ACD','ADA','ADB','ADC','ADD',
#'BAA','BAB','BAC','BAD','BBA','BBB','BBC','BBD','BCA','BCB','BCC','BCD','BDA','BDB','BDC','BDD',
#'CAA','CAB','CAC','CAD','CBA','CBB','CBC','CBD','CCA','CCB','CCC','CCD','CDA','CDB','CDC','CDD',
#'DAA','DAB','DAC','DAD','DBA','DBB','DBC','DBD','DCA','DCB','DCC','DCD','DDA','DDB','DDC','DDD'
# );

my @ptn = (
'AAAA','AAAB','AAAC','AAAD','AABA','AABB','AABC','AABD','AACA','AACB','AACC','AACD','AADA','AADB','AADC','AADD',
'ABAA','ABAB','ABAC','ABAD','ABBA','ABBB','ABBC','ABBD','ABCA','ABCB','ABCC','ABCD','ABDA','ABDB','ABDC','ABDD',
'ACAA','ACAB','ACAC','ACAD','ACBA','ACBB','ACBC','ACBD','ACCA','ACCB','ACCC','ACCD','ACDA','ACDB','ACDC','ACDD',
'ADAA','ADAB','ADAC','ADAD','ADBA','ADBB','ADBC','ADBD','ADCA','ADCB','ADCC','ADCD','ADDA','ADDB','ADDC','ADDD',
'BAAA','BAAB','BAAC','BAAD','BABA','BABB','BABC','BABD','BACA','BACB','BACC','BACD','BADA','BADB','BADC','BADD',
'BBAA','BBAB','BBAC','BBAD','BBBA','BBBB','BBBC','BBBD','BBCA','BBCB','BBCC','BBCD','BBDA','BBDB','BBDC','BBDD',
'BCAA','BCAB','BCAC','BCAD','BCBA','BCBB','BCBC','BCBD','BCCA','BCCB','BCCC','BCCD','BCDA','BCDB','BCDC','BCDD',
'BDAA','BDAB','BDAC','BDAD','BDBA','BDBB','BDBC','BDBD','BDCA','BDCB','BDCC','BDCD','BDDA','BDDB','BDDC','BDDD',
'CAAA','CAAB','CAAC','CAAD','CABA','CABB','CABC','CABD','CACA','CACB','CACC','CACD','CADA','CADB','CADC','CADD',
'CBAA','CBAB','CBAC','CBAD','CBBA','CBBB','CBBC','CBBD','CBCA','CBCB','CBCC','CBCD','CBDA','CBDB','CBDC','CBDD',
'CCAA','CCAB','CCAC','CCAD','CCBA','CCBB','CCBC','CCBD','CCCA','CCCB','CCCC','CCCD','CCDA','CCDB','CCDC','CCDD',
'CDAA','CDAB','CDAC','CDAD','CDBA','CDBB','CDBC','CDBD','CDCA','CDCB','CDCC','CDCD','CDDA','CDDB','CDDC','CDDD',
'DAAA','DAAB','DAAC','DAAD','DABA','DABB','DABC','DABD','DACA','DACB','DACC','DACD','DADA','DADB','DADC','DADD',
'DBAA','DBAB','DBAC','DBAD','DBBA','DBBB','DBBC','DBBD','DBCA','DBCB','DBCC','DBCD','DBDA','DBDB','DBDC','DBDD',
'DCAA','DCAB','DCAC','DCAD','DCBA','DCBB','DCBC','DCBD','DCCA','DCCB','DCCC','DCCD','DCDA','DCDB','DCDC','DCDD',
'DDAA','DDAB','DDAC','DDAD','DDBA','DDBB','DDBC','DDBD','DDCA','DDCB','DDCC','DDCD','DDDA','DDDB','DDDC','DDDD'
);

#my @num = (2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,25,26,28,30,33,34,35,37,38,42,43,44,47,48,52,54,55,56,57,58,59,63);

my $loop = 0;
my $cnt = 0;
my $text = '';
#my $selected = 0;
#my $seltext = '';
while($loop<300)
{
	$cnt=0;
	$text = '';
	$seltext = '';
#	while($cnt<50)
#	{
#		$text = $text . $alfa[int(rand scalar @alfa)];
#		$cnt++;
#	}

	while($cnt<int(50/4))
	{
		$selected = int(rand scalar @ptn);
		$text = $text . $ptn[$selected];
		$seltext = $seltext . $selected . ',';
		$cnt++;
	}

#	while($cnt<int(50/3))
#	{
#		$selected = $num[int(rand scalar @num)];
#		$text = $text . $ptn[$selected];
#		$seltext = $seltext . $selected . ',';
#		$cnt++;
#	}

	$text = $text . $alfa[int(rand scalar @alfa)];
	$text = $text . $alfa[int(rand scalar @alfa)];


	my $url = sprintf($apibaseuri, $text);

	my $ua = LWP::UserAgent->new;
	my $req = HTTP::Request->new('GET', $url);
	$ua->agent($agent);
	my $response = $ua->request($req);

	unless ($response->is_success) {
	    print 'Request: ' . $url, "\n";
	    warn 'Failed to request to WEB API.', "\n";
	} else {
		print $text . ',' . $response->content . ',' . $seltext . "\n";
	}
	$loop++;
	sleep 1;
}
