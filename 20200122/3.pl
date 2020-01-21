my $i=1;
my $sum=0;

while($i<=33333)
{
	if( ($i % 3 == 0) || ($i =~ /3/) )
	{
		$sum += $i;
	}
	$i++;
}
print $sum;
